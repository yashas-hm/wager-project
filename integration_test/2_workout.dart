import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:wger/providers/routines.dart';
import 'package:wger/screens/routine_screen.dart';
import 'package:wger/theme/theme.dart';

import '../test/workout/routine_form_test.mocks.dart';
import '../test_data/exercises.dart';
import '../test_data/routines.dart';

Widget createWorkoutDetailScreen({locale = 'en'}) {
  final key = GlobalKey<NavigatorState>();

  final mockWorkoutProvider = MockRoutinesProvider();
  final workout = getTestRoutine(exercises: getScreenshotExercises());
  when(mockWorkoutProvider.activeRoutine).thenReturn(workout);
  when(mockWorkoutProvider.fetchAndSetRoutineFull(1)).thenAnswer((_) => Future.value(workout));

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<RoutinesProvider>(
        create: (context) => mockWorkoutProvider,
      ),
    ],
    child: MaterialApp(
      locale: Locale(locale),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: wgerLightTheme,
      navigatorKey: key,
      home: TextButton(
        onPressed: () => key.currentState!.push(
          MaterialPageRoute<void>(
            settings: RouteSettings(arguments: workout),
            builder: (_) => const RoutineScreen(),
          ),
        ),
        child: const SizedBox(),
      ),
    ),
  );
}
