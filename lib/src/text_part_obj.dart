import 'package:flutter/material.dart';

class TextPartStyleDefinition {
  TextPartStyleDefinition({required this.pattern, required this.style});
  final String pattern;
  final TextStyle style;
}

class TextPartStyleDefinitions {
  TextPartStyleDefinitions({required this.definitionList});

  final List<TextPartStyleDefinition> definitionList;

  RegExp createCombinedPatternBasedOnStyleMap() {
    final String combinedPatternString = definitionList
        .map<String>((TextPartStyleDefinition textPartStyleDefinition) =>
            textPartStyleDefinition.pattern)
        .join('|');

    return RegExp(combinedPatternString, multiLine: true, caseSensitive: false);
  }

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
