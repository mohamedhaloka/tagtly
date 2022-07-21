import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../manager.dart';
import '../src/text_obj.dart';

class TagtlyTextView extends StatefulWidget {
  const TagtlyTextView(this.text,
      {Key? key,required this.onClick, this.normalTextStyle})
      : super(key: key);
  final String text;
  final ValueChanged<TextObj>? onClick;
  final TextStyle? normalTextStyle;

  @override
  State<TagtlyTextView> createState() => _TagtlyTextViewState();
}

class _TagtlyTextViewState extends State<TagtlyTextView> {

  /// We separate whole of text to pieces into list
  List<TextObj> texts = <TextObj>[];

  /// We use this func to listen for any update get an updated [widget.text]
  /// and generate a text with our tags
  @override
  void didUpdateWidget(covariant TagtlyTextView oldWidget) {
    getFormattedText();
    super.didUpdateWidget(oldWidget);
  }

  Future<void> getFormattedText() async {
    texts = await TagtlyManager.getFormattedText(widget.text);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          children: texts
              .map((t) => TextSpan(
                    text: t.textContent,
                    style: t
                        .textStyle(widget.normalTextStyle ?? const TextStyle()),
                    recognizer: TapGestureRecognizer()
                      ..onTap = t.isHyperlink
                          ? () => t.onClick(widget.onClick!)
                          : null,
                  ))
              .toList()),
    );
  }
}
