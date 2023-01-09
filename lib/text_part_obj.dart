import 'package:flutter/material.dart';
import 'package:tagtly/core/styleable_text_field_controller.dart';
import 'package:tagtly/tagtly.dart';

/// Obj for all pattern with own styles
/// We use it for each pattern in Our [StyleableTextFieldController]
class TextPartStyleDefinition {
  TextPartStyleDefinition({required this.pattern, required this.style});
  final String pattern;
  final TextStyle style;
}

/// Obj for get all [TextPartStyleDefinition] and combine their pattern in [StyleableTextFieldController]
/// and apply style to each text span in [TagtlyTextField]
class TextPartStyleDefinitions {
  TextPartStyleDefinitions({required this.definitionList});

  final List<TextPartStyleDefinition> definitionList;

  /// Get all Regex patterns we pass it in [StyleableTextFieldController] and combine it
  /// as one Regex pattern
  RegExp createCombinedPatternBasedOnStyleMap() {
    final String combinedPatternString = definitionList
        .map<String>((TextPartStyleDefinition textPartStyleDefinition) =>
            textPartStyleDefinition.pattern)
        .join('|');

    return RegExp(combinedPatternString, multiLine: true, caseSensitive: false);
  }

  /// Get each style and search in text for the matcher to apply text into it
  TextPartStyleDefinition? getStyleOfTextPart(String textPart, String text) {
    return List<TextPartStyleDefinition?>.from(definitionList).firstWhere(
      (TextPartStyleDefinition? styleDefinition) {
        if (styleDefinition == null) return false;

        bool hasMatch = false;

        RegExp(styleDefinition.pattern, caseSensitive: false)
            .allMatches(text)
            .forEach(
          (RegExpMatch currentMatch) {
            if (hasMatch) return;

            if (currentMatch.group(0) == textPart) {
              hasMatch = true;
            }
          },
        );

        return hasMatch;
      },
      orElse: () => null,
    );
  }
}
