import 'package:flutter/material.dart';
import 'package:tagtly/src/text_color.dart';
import 'package:tagtly/src/text_enum.dart';

///Model for each text in whole word
class TextObj {
  final String text;
  final TextType type;
  const TextObj({required this.type, required this.text});

  /// For convert these types [TextType.facebook],[TextType.instagram] and [TextType.twitter]
  /// to there urls in the view mode.
  String get textContent {
    switch (type) {
      case TextType.facebook:
        return 'https://www.facebook.com/$username';
      case TextType.twitter:
        return 'https://twitter.com/$username';
      case TextType.instagram:
        return 'https://www.instagram.com/$username';
      default:
        return text;
    }
  }

  /// Get username only from text in facebook , instagram and twitter
  /// Input => "fb: @mohamed_ali" , Output => mohamed_ali
  /// to use it in [textContent] above with url
  String get username {
    int atIndex = text.indexOf('@');
    return text.substring(atIndex).replaceFirst('@', '');
  }

  /// Check text is hypertext to allow clickable or not
  bool get isHyperlink => type != TextType.none;

  /// Every text type has own style
  TextStyle textStyle(TextStyle style) => TextStyle(
      color: _textColor,
      textBaseline: style.textBaseline,
      height: style.height,
      fontSize: style.fontSize,
      fontWeight: style.fontWeight,
      fontFamily: style.fontFamily,
      decorationColor: style.decorationColor,
      decorationStyle: style.decorationStyle,
      decorationThickness: style.decorationThickness,
      fontFamilyFallback: style.fontFamilyFallback,
      fontFeatures: style.fontFeatures,
      fontStyle: style.fontStyle,
      inherit: style.inherit,
      leadingDistribution: style.leadingDistribution,
      letterSpacing: style.letterSpacing,
      backgroundColor: style.backgroundColor,
      locale: style.locale,
      background: style.background,
      debugLabel: style.debugLabel,
      shadows: style.shadows,
      wordSpacing: style.wordSpacing,
      foreground: style.foreground,
      overflow: style.overflow,
      decoration: isHyperlink ? TextDecoration.underline : TextDecoration.none);

  /// Callback [void] for each text to do action when user click in
  void onClick(Function onClick) =>
      onClick.call(TextObj(type: type, text: textContent));

  /// Return text color [Color] depend on type of text
  Color get _textColor {
    switch (type) {
      case TextType.none:
        return TextColor.none;
      case TextType.url:
        return TextColor.url;
      case TextType.hashtag:
        return TextColor.hashtag;
      case TextType.email:
        return TextColor.email;
      case TextType.facebook:
        return TextColor.facebook;
      case TextType.twitter:
        return TextColor.twitter;
      case TextType.instagram:
        return TextColor.insta;
      case TextType.date:
        return TextColor.date;
      case TextType.time:
        return TextColor.time;
    }
  }
}
