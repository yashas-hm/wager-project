// Mocks generated by Mockito 5.4.4 from annotations
// in wger/test/weight/weight_screen_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:ui' as _i11;

import 'package:flutter/material.dart' as _i13;
import 'package:mockito/mockito.dart' as _i1;
import 'package:wger/database/ingredients/ingredients_database.dart' as _i4;
import 'package:wger/models/body_weight/weight_entry.dart' as _i3;
import 'package:wger/models/exercises/ingredient_api.dart' as _i16;
import 'package:wger/models/nutrition/ingredient.dart' as _i8;
import 'package:wger/models/nutrition/meal.dart' as _i6;
import 'package:wger/models/nutrition/meal_item.dart' as _i7;
import 'package:wger/models/nutrition/nutritional_plan.dart' as _i5;
import 'package:wger/models/user/profile.dart' as _i14;
import 'package:wger/providers/base_provider.dart' as _i2;
import 'package:wger/providers/body_weight.dart' as _i9;
import 'package:wger/providers/nutrition.dart' as _i15;
import 'package:wger/providers/user.dart' as _i12;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWgerBaseProvider_0 extends _i1.SmartFake implements _i2.WgerBaseProvider {
  _FakeWgerBaseProvider_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeWeightEntry_1 extends _i1.SmartFake implements _i3.WeightEntry {
  _FakeWeightEntry_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIngredientDatabase_2 extends _i1.SmartFake implements _i4.IngredientDatabase {
  _FakeIngredientDatabase_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeNutritionalPlan_3 extends _i1.SmartFake implements _i5.NutritionalPlan {
  _FakeNutritionalPlan_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMeal_4 extends _i1.SmartFake implements _i6.Meal {
  _FakeMeal_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeMealItem_5 extends _i1.SmartFake implements _i7.MealItem {
  _FakeMealItem_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeIngredient_6 extends _i1.SmartFake implements _i8.Ingredient {
  _FakeIngredient_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BodyWeightProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockBodyWeightProvider extends _i1.Mock implements _i9.BodyWeightProvider {
  MockBodyWeightProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WgerBaseProvider get baseProvider => (super.noSuchMethod(
        Invocation.getter(#baseProvider),
        returnValue: _FakeWgerBaseProvider_0(
          this,
          Invocation.getter(#baseProvider),
        ),
      ) as _i2.WgerBaseProvider);

  @override
  List<_i3.WeightEntry> get items => (super.noSuchMethod(
        Invocation.getter(#items),
        returnValue: <_i3.WeightEntry>[],
      ) as List<_i3.WeightEntry>);

  @override
  set items(List<_i3.WeightEntry>? entries) => super.noSuchMethod(
        Invocation.setter(
          #items,
          entries,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i3.WeightEntry findById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #findById,
          [id],
        ),
        returnValue: _FakeWeightEntry_1(
          this,
          Invocation.method(
            #findById,
            [id],
          ),
        ),
      ) as _i3.WeightEntry);

  @override
  _i3.WeightEntry? findByDate(DateTime? date) => (super.noSuchMethod(Invocation.method(
        #findByDate,
        [date],
      )) as _i3.WeightEntry?);

  @override
  _i10.Future<List<_i3.WeightEntry>> fetchAndSetEntries() => (super.noSuchMethod(
        Invocation.method(
          #fetchAndSetEntries,
          [],
        ),
        returnValue: _i10.Future<List<_i3.WeightEntry>>.value(<_i3.WeightEntry>[]),
      ) as _i10.Future<List<_i3.WeightEntry>>);

  @override
  _i10.Future<_i3.WeightEntry> addEntry(_i3.WeightEntry? entry) => (super.noSuchMethod(
        Invocation.method(
          #addEntry,
          [entry],
        ),
        returnValue: _i10.Future<_i3.WeightEntry>.value(_FakeWeightEntry_1(
          this,
          Invocation.method(
            #addEntry,
            [entry],
          ),
        )),
      ) as _i10.Future<_i3.WeightEntry>);

  @override
  _i10.Future<void> editEntry(_i3.WeightEntry? entry) => (super.noSuchMethod(
        Invocation.method(
          #editEntry,
          [entry],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> deleteEntry(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deleteEntry,
          [id],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [UserProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockUserProvider extends _i1.Mock implements _i12.UserProvider {
  MockUserProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i13.ThemeMode get themeMode => (super.noSuchMethod(
        Invocation.getter(#themeMode),
        returnValue: _i13.ThemeMode.system,
      ) as _i13.ThemeMode);

  @override
  set themeMode(_i13.ThemeMode? _themeMode) => super.noSuchMethod(
        Invocation.setter(
          #themeMode,
          _themeMode,
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i2.WgerBaseProvider get baseProvider => (super.noSuchMethod(
        Invocation.getter(#baseProvider),
        returnValue: _FakeWgerBaseProvider_0(
          this,
          Invocation.getter(#baseProvider),
        ),
      ) as _i2.WgerBaseProvider);

  @override
  set profile(_i14.Profile? _profile) => super.noSuchMethod(
        Invocation.setter(
          #profile,
          _profile,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setThemeMode(_i13.ThemeMode? mode) => super.noSuchMethod(
        Invocation.method(
          #setThemeMode,
          [mode],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i10.Future<void> fetchAndSetProfile() => (super.noSuchMethod(
        Invocation.method(
          #fetchAndSetProfile,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> saveProfile() => (super.noSuchMethod(
        Invocation.method(
          #saveProfile,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> verifyEmail() => (super.noSuchMethod(
        Invocation.method(
          #verifyEmail,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [NutritionPlansProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockNutritionPlansProvider extends _i1.Mock implements _i15.NutritionPlansProvider {
  MockNutritionPlansProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WgerBaseProvider get baseProvider => (super.noSuchMethod(
        Invocation.getter(#baseProvider),
        returnValue: _FakeWgerBaseProvider_0(
          this,
          Invocation.getter(#baseProvider),
        ),
      ) as _i2.WgerBaseProvider);

  @override
  _i4.IngredientDatabase get database => (super.noSuchMethod(
        Invocation.getter(#database),
        returnValue: _FakeIngredientDatabase_2(
          this,
          Invocation.getter(#database),
        ),
      ) as _i4.IngredientDatabase);

  @override
  set database(_i4.IngredientDatabase? _database) => super.noSuchMethod(
        Invocation.setter(
          #database,
          _database,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i8.Ingredient> get ingredients => (super.noSuchMethod(
        Invocation.getter(#ingredients),
        returnValue: <_i8.Ingredient>[],
      ) as List<_i8.Ingredient>);

  @override
  set ingredients(List<_i8.Ingredient>? _ingredients) => super.noSuchMethod(
        Invocation.setter(
          #ingredients,
          _ingredients,
        ),
        returnValueForMissingStub: null,
      );

  @override
  List<_i5.NutritionalPlan> get items => (super.noSuchMethod(
        Invocation.getter(#items),
        returnValue: <_i5.NutritionalPlan>[],
      ) as List<_i5.NutritionalPlan>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void clear() => super.noSuchMethod(
        Invocation.method(
          #clear,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i5.NutritionalPlan findById(int? id) => (super.noSuchMethod(
        Invocation.method(
          #findById,
          [id],
        ),
        returnValue: _FakeNutritionalPlan_3(
          this,
          Invocation.method(
            #findById,
            [id],
          ),
        ),
      ) as _i5.NutritionalPlan);

  @override
  _i6.Meal? findMealById(int? id) => (super.noSuchMethod(Invocation.method(
        #findMealById,
        [id],
      )) as _i6.Meal?);

  @override
  _i10.Future<void> fetchAndSetAllPlansSparse() => (super.noSuchMethod(
        Invocation.method(
          #fetchAndSetAllPlansSparse,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> fetchAndSetAllPlansFull() => (super.noSuchMethod(
        Invocation.method(
          #fetchAndSetAllPlansFull,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<_i5.NutritionalPlan> fetchAndSetPlanSparse(int? planId) => (super.noSuchMethod(
        Invocation.method(
          #fetchAndSetPlanSparse,
          [planId],
        ),
        returnValue: _i10.Future<_i5.NutritionalPlan>.value(_FakeNutritionalPlan_3(
          this,
          Invocation.method(
            #fetchAndSetPlanSparse,
            [planId],
          ),
        )),
      ) as _i10.Future<_i5.NutritionalPlan>);

  @override
  _i10.Future<_i5.NutritionalPlan> fetchAndSetPlanFull(int? planId) => (super.noSuchMethod(
        Invocation.method(
          #fetchAndSetPlanFull,
          [planId],
        ),
        returnValue: _i10.Future<_i5.NutritionalPlan>.value(_FakeNutritionalPlan_3(
          this,
          Invocation.method(
            #fetchAndSetPlanFull,
            [planId],
          ),
        )),
      ) as _i10.Future<_i5.NutritionalPlan>);

  @override
  _i10.Future<_i5.NutritionalPlan> addPlan(_i5.NutritionalPlan? planData) => (super.noSuchMethod(
        Invocation.method(
          #addPlan,
          [planData],
        ),
        returnValue: _i10.Future<_i5.NutritionalPlan>.value(_FakeNutritionalPlan_3(
          this,
          Invocation.method(
            #addPlan,
            [planData],
          ),
        )),
      ) as _i10.Future<_i5.NutritionalPlan>);

  @override
  _i10.Future<void> editPlan(_i5.NutritionalPlan? plan) => (super.noSuchMethod(
        Invocation.method(
          #editPlan,
          [plan],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> deletePlan(int? id) => (super.noSuchMethod(
        Invocation.method(
          #deletePlan,
          [id],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<_i6.Meal> addMeal(
    _i6.Meal? meal,
    int? planId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addMeal,
          [
            meal,
            planId,
          ],
        ),
        returnValue: _i10.Future<_i6.Meal>.value(_FakeMeal_4(
          this,
          Invocation.method(
            #addMeal,
            [
              meal,
              planId,
            ],
          ),
        )),
      ) as _i10.Future<_i6.Meal>);

  @override
  _i10.Future<_i6.Meal> editMeal(_i6.Meal? meal) => (super.noSuchMethod(
        Invocation.method(
          #editMeal,
          [meal],
        ),
        returnValue: _i10.Future<_i6.Meal>.value(_FakeMeal_4(
          this,
          Invocation.method(
            #editMeal,
            [meal],
          ),
        )),
      ) as _i10.Future<_i6.Meal>);

  @override
  _i10.Future<void> deleteMeal(_i6.Meal? meal) => (super.noSuchMethod(
        Invocation.method(
          #deleteMeal,
          [meal],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<_i7.MealItem> addMealItem(
    _i7.MealItem? mealItem,
    _i6.Meal? meal,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addMealItem,
          [
            mealItem,
            meal,
          ],
        ),
        returnValue: _i10.Future<_i7.MealItem>.value(_FakeMealItem_5(
          this,
          Invocation.method(
            #addMealItem,
            [
              mealItem,
              meal,
            ],
          ),
        )),
      ) as _i10.Future<_i7.MealItem>);

  @override
  _i10.Future<void> deleteMealItem(_i7.MealItem? mealItem) => (super.noSuchMethod(
        Invocation.method(
          #deleteMealItem,
          [mealItem],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> clearIngredientCache() => (super.noSuchMethod(
        Invocation.method(
          #clearIngredientCache,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<_i8.Ingredient> fetchIngredient(
    int? ingredientId, {
    _i4.IngredientDatabase? database,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchIngredient,
          [ingredientId],
          {#database: database},
        ),
        returnValue: _i10.Future<_i8.Ingredient>.value(_FakeIngredient_6(
          this,
          Invocation.method(
            #fetchIngredient,
            [ingredientId],
            {#database: database},
          ),
        )),
      ) as _i10.Future<_i8.Ingredient>);

  @override
  _i10.Future<void> fetchIngredientsFromCache() => (super.noSuchMethod(
        Invocation.method(
          #fetchIngredientsFromCache,
          [],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<List<_i16.IngredientApiSearchEntry>> searchIngredient(
    String? name, {
    String? languageCode = r'en',
    bool? searchEnglish = false,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchIngredient,
          [name],
          {
            #languageCode: languageCode,
            #searchEnglish: searchEnglish,
          },
        ),
        returnValue: _i10.Future<List<_i16.IngredientApiSearchEntry>>.value(
            <_i16.IngredientApiSearchEntry>[]),
      ) as _i10.Future<List<_i16.IngredientApiSearchEntry>>);

  @override
  _i10.Future<_i8.Ingredient?> searchIngredientWithCode(String? code) => (super.noSuchMethod(
        Invocation.method(
          #searchIngredientWithCode,
          [code],
        ),
        returnValue: _i10.Future<_i8.Ingredient?>.value(),
      ) as _i10.Future<_i8.Ingredient?>);

  @override
  _i10.Future<void> logMealToDiary(_i6.Meal? meal) => (super.noSuchMethod(
        Invocation.method(
          #logMealToDiary,
          [meal],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> logIngredientToDiary(
    _i7.MealItem? mealItem,
    int? planId, [
    DateTime? dateTime,
  ]) =>
      (super.noSuchMethod(
        Invocation.method(
          #logIngredientToDiary,
          [
            mealItem,
            planId,
            dateTime,
          ],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> deleteLog(
    int? logId,
    int? planId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteLog,
          [
            logId,
            planId,
          ],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  _i10.Future<void> fetchAndSetLogs(_i5.NutritionalPlan? plan) => (super.noSuchMethod(
        Invocation.method(
          #fetchAndSetLogs,
          [plan],
        ),
        returnValue: _i10.Future<void>.value(),
        returnValueForMissingStub: _i10.Future<void>.value(),
      ) as _i10.Future<void>);

  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}
