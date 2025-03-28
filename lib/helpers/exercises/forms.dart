import 'package:flutter/material.dart';
import 'package:wger/l10n/generated/app_localizations.dart';

/// The amount of characters an exercise description needs to have
const MIN_CHARS_DESCRIPTION = 40;

/// The amount of characters an exercise name needs to have
const MIN_CHARS_NAME = 5;
const MAX_CHARS_NAME = 40;

String? validateName(String? name, BuildContext context) {
  if (name!.isEmpty) {
    return AppLocalizations.of(context).enterValue;
  }

  if (name.length < MIN_CHARS_NAME || name.length > MAX_CHARS_NAME) {
    return AppLocalizations.of(context).enterCharacters(
      MIN_CHARS_NAME.toString(),
      MAX_CHARS_NAME.toString(),
    );
  }

  return null;
}

String? validateDescription(String? name, BuildContext context) {
  if (name!.isEmpty) {
    return AppLocalizations.of(context).enterValue;
  }

  if (name.length < MIN_CHARS_DESCRIPTION) {
    return AppLocalizations.of(context).enterMinCharacters(MIN_CHARS_DESCRIPTION.toString());
  }

  return null;
}
