/*
 * This file is part of wger Workout Manager <https://github.com/wger-project>.
 * Copyright (C) 2020, 2021 wger Team
 *
 * wger Workout Manager is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Affero General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Affero General Public License for more details.
 *
 * You should have received a copy of the GNU Affero General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */

import 'dart:convert';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wger/exceptions/http_exception.dart';
import 'package:wger/helpers/consts.dart';
import 'package:wger/models/exercises/exercise.dart';
import 'package:wger/models/exercises/translation.dart';
import 'package:wger/models/workouts/day.dart';
import 'package:wger/models/workouts/day_data.dart';
import 'package:wger/models/workouts/log.dart';
import 'package:wger/models/workouts/repetition_unit.dart';
import 'package:wger/models/workouts/routine.dart';
import 'package:wger/models/workouts/session.dart';
import 'package:wger/models/workouts/slot.dart';
import 'package:wger/models/workouts/slot_entry.dart';
import 'package:wger/models/workouts/weight_unit.dart';
import 'package:wger/providers/base_provider.dart';
import 'package:wger/providers/exercises.dart';

class RoutinesProvider with ChangeNotifier {
  static const _routinesUrlPath = 'routine';
  static const _routinesStructureSubpath = 'structure';
  static const _routinesDateSequenceSubpath = 'date-sequence-display';
  static const _routinesCurrentIterationDisplaySubpath = 'current-iteration-display';
  static const _routinesCurrentIterationGymSubpath = 'current-iteration-gym';
  static const _daysUrlPath = 'day';
  static const _slotsUrlPath = 'slot';
  static const _slotEntriesUrlPath = 'slot-entry';
  static const _logsUrlPath = 'workoutlog';
  static const _sessionUrlPath = 'workoutsession';
  static const _weightUnitUrlPath = 'setting-weightunit';
  static const _repetitionUnitUrlPath = 'setting-repetitionunit';

  Routine? _currentPlan;
  final ExercisesProvider _exercises;
  final WgerBaseProvider baseProvider;
  List<Routine> _workoutPlans = [];
  List<WeightUnit> _weightUnits = [];
  List<RepetitionUnit> _repetitionUnit = [];

  RoutinesProvider(
    this.baseProvider,
    ExercisesProvider exercises,
    List<Routine> entries,
  )   : _exercises = exercises,
        _workoutPlans = entries;

  List<Routine> get items {
    return [..._workoutPlans];
  }

  List<WeightUnit> get weightUnits {
    return [..._weightUnits];
  }

  /// Clears all lists
  void clear() {
    _currentPlan = null;
    _workoutPlans = [];
    _weightUnits = [];
    _repetitionUnit = [];
  }

  /// Return the default weight unit (kg)
  WeightUnit get defaultWeightUnit {
    return _weightUnits.firstWhere((element) => element.id == DEFAULT_WEIGHT_UNIT);
  }

  List<RepetitionUnit> get repetitionUnits {
    return [..._repetitionUnit];
  }

  /// Return the default weight unit (reps)
  RepetitionUnit get defaultRepetitionUnit {
    return _repetitionUnit.firstWhere((element) => element.id == REP_UNIT_REPETITIONS);
  }

  List<Routine> getPlans() {
    return _workoutPlans;
  }

  Routine findById(int id) {
    return _workoutPlans.firstWhere((workoutPlan) => workoutPlan.id == id);
  }

  int findIndexById(int id) {
    return _workoutPlans.indexWhere((workoutPlan) => workoutPlan.id == id);
  }

  /// Set the currently "active" workout plan
  void setCurrentPlan(int id) {
    _currentPlan = findById(id);
  }

  /// Returns the currently "active" workout plan
  Routine? get currentPlan {
    return _currentPlan;
  }

  /// Reset the currently "active" workout plan to null
  void resetCurrentPlan() {
    _currentPlan = null;
  }

  /// Returns the current active workout plan. At the moment this is just
  /// the latest, but this might change in the future.
  Routine? get activePlan {
    if (_workoutPlans.isNotEmpty) {
      return _workoutPlans.first;
    }
    return null;
  }

  /*
   * Workouts
   */

  /// Fetches and sets all workout plans fully, i.e. with all corresponding child
  /// attributes
  Future<void> fetchAndSetAllPlansFull() async {
    final data = await baseProvider.fetch(
      baseProvider.makeUrl(
        _routinesUrlPath,
        query: {'ordering': '-creation_date', 'limit': '1000'},
      ),
    );
    for (final entry in data['results']) {
      await fetchAndSetWorkoutPlanFull(entry['id']);
    }

    notifyListeners();
  }

  /// Fetches all workout plan sparsely, i.e. only with the data on the plan
  /// object itself and no child attributes
  Future<void> fetchAndSetAllPlansSparse() async {
    final data = await baseProvider.fetch(
      baseProvider.makeUrl(_routinesUrlPath, query: {'limit': '1000'}),
    );
    _workoutPlans = [];
    for (final workoutPlanData in data['results']) {
      final plan = Routine.fromJson(workoutPlanData);
      _workoutPlans.add(plan);
    }

    // _workoutPlans.sort((a, b) => b.created.compareTo(a.created));
    notifyListeners();
  }

  void setExercisesAndUnits(List<DayData> entries) async {
    for (final entry in entries) {
      for (final slot in entry.slots) {
        for (final setConfig in slot.setConfigs) {
          setConfig.exercise = (await _exercises.fetchAndSetExercise(setConfig.exerciseId))!;

          // setConfig.repsUnit = _repetitionUnit.firstWhere(
          //   (e) => e.id == setConfig.repsUnitId,
          // );
          //
          // setConfig.weightUnit = _weightUnits.firstWhere(
          //   (e) => e.id == setConfig.weightUnitId,
          // );
        }
      }
    }
  }

  /// Fetches a workout plan sparsely, i.e. only with the data on the plan
  /// object itself and no child attributes
  Future<Routine> fetchAndSetPlanSparse(int planId) async {
    final fullPlanData = await baseProvider.fetch(
      baseProvider.makeUrl(_routinesUrlPath, id: planId),
    );
    final plan = Routine.fromJson(fullPlanData);
    _workoutPlans.add(plan);
    _workoutPlans.sort((a, b) => b.created.compareTo(a.created));

    notifyListeners();
    return plan;
  }

  /// Fetches a workout plan fully, i.e. with all corresponding child attributes
  Future<Routine> fetchAndSetWorkoutPlanFull(int routineId) async {
    // Fetch structure and computed data
    final results = await Future.wait([
      baseProvider.fetch(
        baseProvider.makeUrl(
          _routinesUrlPath,
          objectMethod: _routinesStructureSubpath,
          id: routineId,
        ),
      ),
      baseProvider.fetch(
        baseProvider.makeUrl(
          _routinesUrlPath,
          id: routineId,
          objectMethod: _routinesDateSequenceSubpath,
        ),
      ),
      baseProvider.fetch(
        baseProvider.makeUrl(
          _routinesUrlPath,
          id: routineId,
          objectMethod: _routinesCurrentIterationDisplaySubpath,
        ),
      ),
      baseProvider.fetch(
        baseProvider.makeUrl(
          _routinesUrlPath,
          id: routineId,
          objectMethod: _routinesCurrentIterationGymSubpath,
        ),
      ),
      baseProvider.fetchPaginated(baseProvider.makeUrl(
        _logsUrlPath,
        query: {'workout': routineId.toString(), 'limit': '900'},
      ))
    ]);

    final routine = Routine.fromJson(results[0] as Map<String, dynamic>);

    final dayData = results[1] as List<dynamic>;
    final currentIterationDisplayData = results[2] as List<dynamic>;
    final currentIterationGymData = results[2] as List<dynamic>;
    final logData = results[3] as List<dynamic>;

    /*
     * Set exercise, repetition and weight unit objects
     */
    final dayDataEntries = dayData.map((entry) => DayData.fromJson(entry)).toList();
    setExercisesAndUnits(dayDataEntries); // in-place update

    final currentIterationDayDataEntries =
        currentIterationDisplayData.map((entry) => DayData.fromJson(entry)).toList();
    setExercisesAndUnits(currentIterationDayDataEntries); // in-place update

    // final currentIterationDayDataEntriesGym =
    //     currentIterationGymData.map((entry) => DayData.fromJson(entry)).toList();
    // setExercisesAndUnits(currentIterationDayDataEntriesGym); // in-place update

    for (final day in routine.days) {
      for (final slot in day.slots) {
        for (final slotEntry in slot.entries) {
          slotEntry.exerciseObj = (await _exercises.fetchAndSetExercise(slotEntry.exerciseId))!;
          slotEntry.repetitionUnitObj = _repetitionUnit.firstWhere(
            (e) => e.id == slotEntry.repetitionUnitId,
          );
          slotEntry.weightUnitObj = _weightUnits.firstWhere(
            (e) => e.id == slotEntry.weightUnitId,
          );
        }
      }
    }

    routine.dayData = dayDataEntries;
    routine.dayDataCurrentIteration = currentIterationDayDataEntries;
    // routine.dayDataCurrentIterationGym = currentIterationDayDataEntriesGym;

    // Logs
    routine.logs = [];

    // final logData = await baseProvider.fetchPaginated(baseProvider.makeUrl(
    //   _logsUrlPath,
    //   query: {'workout': routineId.toString(), 'limit': '900'},
    // ));
    for (final logEntry in logData) {
      try {
        final log = Log.fromJson(logEntry);
        log.weightUnit = _weightUnits.firstWhere((e) => e.id == log.weightUnitId);
        log.repetitionUnit = _repetitionUnit.firstWhere((e) => e.id == log.weightUnitId);
        log.exerciseBase = (await _exercises.fetchAndSetExercise(log.exerciseId))!;
        routine.logs.add(log);
      } catch (e) {
        dev.log('Error while processing the logs for a routine!');
        dev.log(e.toString());
      }
    }

    // ... and done
    final routineIndex = _workoutPlans.indexWhere((r) => r.id == routineId);
    _workoutPlans.replaceRange(routineIndex, routineIndex + 1, [routine]);

    notifyListeners();
    return routine;
  }

  Future<Routine> addRoutine(Routine routine) async {
    final data = await baseProvider.post(
      routine.toJson(),
      baseProvider.makeUrl(_routinesUrlPath),
    );
    final plan = Routine.fromJson(data);
    _workoutPlans.insert(0, plan);
    notifyListeners();
    return plan;
  }

  Future<void> editWorkout(Routine workout) async {
    await baseProvider.patch(
      workout.toJson(),
      baseProvider.makeUrl(_routinesUrlPath, id: workout.id),
    );
    notifyListeners();
  }

  Future<void> deleteWorkout(int id) async {
    final existingWorkoutIndex = _workoutPlans.indexWhere((element) => element.id == id);
    final existingWorkout = _workoutPlans[existingWorkoutIndex];
    _workoutPlans.removeAt(existingWorkoutIndex);
    notifyListeners();

    final response = await baseProvider.deleteRequest(_routinesUrlPath, id);

    if (response.statusCode >= 400) {
      _workoutPlans.insert(existingWorkoutIndex, existingWorkout);
      notifyListeners();
      throw WgerHttpException(response.body);
    }
  }

  Future<Map<String, dynamic>> fetchLogData(
    Routine workout,
    Exercise base,
  ) async {
    final data = await baseProvider.fetch(
      baseProvider.makeUrl(
        _routinesUrlPath,
        id: workout.id,
        objectMethod: 'log_data',
        query: {'id': base.id.toString()},
      ),
    );
    return data;
  }

  /// Fetch and set weight units for workout (kg, lb, plate, etc.)
  Future<void> fetchAndSetRepetitionUnits() async {
    final response =
        await baseProvider.fetchPaginated(baseProvider.makeUrl(_repetitionUnitUrlPath));
    for (final unit in response) {
      _repetitionUnit.add(RepetitionUnit.fromJson(unit));
    }
  }

  /// Fetch and set weight units for workout (kg, lb, plate, etc.)
  Future<void> fetchAndSetWeightUnits() async {
    final response = await baseProvider.fetchPaginated(baseProvider.makeUrl(_weightUnitUrlPath));
    for (final unit in response) {
      _weightUnits.add(WeightUnit.fromJson(unit));
    }
  }

  Future<void> fetchAndSetUnits() async {
    // Load units from cache, if available
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey(PREFS_WORKOUT_UNITS)) {
      final unitData = json.decode(prefs.getString(PREFS_WORKOUT_UNITS)!);
      if (DateTime.parse(unitData['expiresIn']).isAfter(DateTime.now())) {
        unitData['repetitionUnits'].forEach(
          (e) => _repetitionUnit.add(RepetitionUnit.fromJson(e)),
        );
        unitData['weightUnit'].forEach(
          (e) => _weightUnits.add(WeightUnit.fromJson(e)),
        );
        dev.log(
          "Read workout units data from cache. Valid till ${unitData['expiresIn']}",
        );
        return;
      }
    }

    // Load units
    await fetchAndSetWeightUnits();
    await fetchAndSetRepetitionUnits();

    // Save the result to the cache
    final cacheData = {
      'date': DateTime.now().toIso8601String(),
      'expiresIn': DateTime.now().add(const Duration(days: DAYS_TO_CACHE)).toIso8601String(),
      'repetitionUnits': _repetitionUnit.map((e) => e.toJson()).toList(),
      'weightUnit': _weightUnits.map((e) => e.toJson()).toList(),
    };
    prefs.setString(PREFS_WORKOUT_UNITS, json.encode(cacheData));
    notifyListeners();
  }

  /*
   * Days
   */
  Future<Day> addDay(Day day, Routine workout) async {
    /*
     * Saves a new day instance to the DB and adds it to the given workout
     */
    day.routineId = workout.id!;
    final data = await baseProvider.post(
      day.toJson(),
      baseProvider.makeUrl(_daysUrlPath),
    );
    day = Day.fromJson(data);
    day.slots = [];
    workout.days.insert(0, day);
    notifyListeners();
    return day;
  }

  Future<void> editDay(Day day) async {
    await baseProvider.patch(
      day.toJson(),
      baseProvider.makeUrl(_daysUrlPath, id: day.id),
    );
    notifyListeners();
  }

  Future<void> deleteDay(Day day) async {
    await baseProvider.deleteRequest(_daysUrlPath, day.id!);
    for (final workout in _workoutPlans) {
      workout.days.removeWhere((element) => element.id == day.id);
    }
    notifyListeners();
  }

  /*
   * Sets
   */
  Future<Slot> addSet(Slot workoutSet) async {
    final data = await baseProvider.post(
      workoutSet.toJson(),
      baseProvider.makeUrl(_slotsUrlPath),
    );
    final set = Slot.fromJson(data);
    notifyListeners();
    return set;
  }

  Future<void> editSet(Slot workoutSet) async {
    await baseProvider.patch(
      workoutSet.toJson(),
      baseProvider.makeUrl(_slotsUrlPath, id: workoutSet.id),
    );
    notifyListeners();
  }

  Future<List<Slot>> reorderSets(List<Slot> sets, int startIndex) async {
    for (int i = startIndex; i < sets.length; i++) {
      sets[i].order = i;
      await baseProvider.patch(
        sets[i].toJson(),
        baseProvider.makeUrl(_slotsUrlPath, id: sets[i].id),
      );
    }
    notifyListeners();
    return sets;
  }

  Future<void> fetchComputedSettings(Slot workoutSet) async {
    final data = await baseProvider.fetch(
      baseProvider.makeUrl(
        _slotsUrlPath,
        id: workoutSet.id,
        objectMethod: 'computed_settings',
      ),
    );

    final List<SlotEntry> settings = [];
    data['results'].forEach((e) {
      final SlotEntry workoutSetting = SlotEntry.fromJson(e);

      workoutSetting.weightUnitObj = _weightUnits.firstWhere(
        (unit) => unit.id == workoutSetting.weightUnitId,
      );
      workoutSetting.repetitionUnitObj = _repetitionUnit.firstWhere(
        (unit) => unit.id == workoutSetting.repetitionUnitId,
      );
      settings.add(workoutSetting);
    });

    workoutSet.settingsComputed = settings;
    notifyListeners();
  }

  Future<String> fetchSmartText(Slot workoutSet, Translation exercise) async {
    final data = await baseProvider.fetch(
      baseProvider.makeUrl(
        _slotsUrlPath,
        id: workoutSet.id,
        objectMethod: 'smart_text',
        query: {'exercise': exercise.id.toString()},
      ),
    );

    return data['results'];
  }

  Future<void> deleteSet(int setId) async {
    await baseProvider.deleteRequest(_slotsUrlPath, setId);

    for (final workout in _workoutPlans) {
      for (final day in workout.days) {
        day.slots.removeWhere((element) => element.id == setId);
      }
    }
    notifyListeners();
  }

  /*
   * Setting
   */
  Future<SlotEntry> addSetting(SlotEntry workoutSetting) async {
    final data = await baseProvider.post(
      workoutSetting.toJson(),
      baseProvider.makeUrl(_slotEntriesUrlPath),
    );
    final setting = SlotEntry.fromJson(data);
    notifyListeners();
    return setting;
  }

  /*
   * Sessions
   */
  Future<dynamic> fetchSessionData() async {
    final data = await baseProvider.fetch(
      baseProvider.makeUrl(_sessionUrlPath),
    );
    return data;
  }

  Future<WorkoutSession> addSession(WorkoutSession session) async {
    final data = await baseProvider.post(
      session.toJson(),
      baseProvider.makeUrl(_sessionUrlPath),
    );
    final newSession = WorkoutSession.fromJson(data);
    notifyListeners();
    return newSession;
  }

  /*
   * Logs
   */
  Future<Log> addLog(Log log) async {
    final data = await baseProvider.post(
      log.toJson(),
      baseProvider.makeUrl(_logsUrlPath),
    );
    final newLog = Log.fromJson(data);

    log.id = newLog.id;
    log.weightUnit = _weightUnits.firstWhere((e) => e.id == log.weightUnitId);
    log.repetitionUnit = _repetitionUnit.firstWhere((e) => e.id == log.weightUnitId);
    log.exerciseBase = (await _exercises.fetchAndSetExercise(log.exerciseId))!;

    final plan = findById(log.routineId);
    plan.logs.add(log);
    notifyListeners();
    return newLog;
  }

  /*Future<void> editLog(Log log) async {
    await patch(log.toJson(), makeUrl(_logsUrlPath, id: log.id));
    notifyListeners();
  }*/

  Future<void> deleteLog(Log log) async {
    await baseProvider.deleteRequest(_logsUrlPath, log.id!);
    for (final workout in _workoutPlans) {
      workout.logs.removeWhere((element) => element.id == log.id);
    }
    notifyListeners();
  }
}
