import 'package:flutter/material.dart';

import '../src/text_part_obj.dart';

/// Custom controller obj extend [TextEditingController]
/// using to highlight part of text in text field by our patterns
class StyleableTextFieldController extends TextEditingController {
  StyleableTextFieldController({required this.styles})
      : combinedPattern = styles.createCombinedPatternBasedOnStyleMap();
  final TextPartStyleDefinitions styles;
  final Pattern combinedPattern;

  /// Using to detect match text by comparing every part of text with our patterns
  /// In Match Case: add own style depend on pattern
  /// In Non-Match Case: add text with normal text field style
  @override
  TextSpan buildTextSpan(
      {required BuildContext context,
      TextStyle? style,
      required bool withComposing}) {
    final List<InlineSpan> textSpanChildren = <InlineSpan>[];

    text.splitMapJoin(
      combinedPattern,
      onMatch: (Match match) {
        final String? textPart = match.group(0);

        if (textPart == null) return '';

        final TextPartStyleDefinition? styleDefinition =
            styles.getStyleOfTextPart(textPart, text);

        if (styleDefinition == null) return '';

        _addTextSpan(
          textSpanChildren,
          textPart,
          style?.merge(styleDefinition.style),
        );

        return '';
      },
      onNonMatch: (String text) {
        _addTextSpan(textSpanChildren, text, style);

        return '';
      },
    );

    return TextSpan(style: style, children: textSpanChildren);
  }

  ///every part in text field is a [TextSpan] has own style
  void _addTextSpan(List<InlineSpan> textSpanChildren, String? textToBeStyled,
      TextStyle? style) {
    textSpanChildren.add(
      TextSpan(
        text: textToBeStyled!,
        style: style,
      ),
    );
  }
}
