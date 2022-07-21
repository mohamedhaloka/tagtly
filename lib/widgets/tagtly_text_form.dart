import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../manager.dart';

class TagtlyTextField extends StatelessWidget {
  const TagtlyTextField(
      {Key? key,
      this.onChanged,
      this.textInputAction,
      this.textDirection,
      this.decoration,
      this.onTap,
      this.enabled,
      this.autocorrect = false,
      this.autofillHints,
      this.autofocus = false,
      this.autoValidateMode,
      this.buildCounter,
      this.cursorColor,
      this.cursorHeight,
      this.cursorRadius,
      this.cursorWidth = 2.0,
      this.enableIMEPersonalizedLearning = true,
      this.enableInteractiveSelection = false,
      this.enableSuggestions = false,
      this.expands = false,
      this.focusNode,
      this.initialValue,
      this.inputFormatters,
      this.keyboardAppearance,
      this.keyboardType,
      this.maxLength,
      this.maxLengthEnforcement,
      this.minLines,
      this.obscureText = false,
      this.obscuringCharacter = '•',
      this.onEditingComplete,
      this.onFieldSubmitted,
      this.onSaved,
      this.readOnly = false,
      this.restorationId,
      this.scrollController,
      this.scrollPadding = const EdgeInsets.all(20.0),
      this.scrollPhysics,
      this.selectionControls,
      this.showCursor = true,
      this.smartDashesType,
      this.smartQuotesType,
      this.strutStyle,
      this.style,
      this.textAlign = TextAlign.start,
      this.textAlignVertical,
      this.textCapitalization = TextCapitalization.none,
      this.toolbarOptions,
      this.validator})
      : super(key: key);

  final Function? onSaved, onEditingComplete, onFieldSubmitted;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final bool? autocorrect,
      enableSuggestions,
      obscureText,
      readOnly,
      showCursor,
      enableInteractiveSelection,
      expands,
      autofocus;
  final String? obscuringCharacter;
  final InputDecoration? decoration;
  final TextSelectionControls? selectionControls;
  final TextInputType? keyboardType;
  final TextDirection? textDirection;
  final TextInputAction? textInputAction;
  final EdgeInsets scrollPadding;
  final Iterable<String>? autofillHints;
  final AutovalidateMode? autoValidateMode;
  final InputCounterWidgetBuilder? buildCounter;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final bool? enabled;
  final double cursorWidth;
  final double? cursorHeight;
  final Radius? cursorRadius;
  final Color? cursorColor;
  final ScrollController? scrollController;
  final String? restorationId;
  final bool enableIMEPersonalizedLearning;
  final String? initialValue;
  final FocusNode? focusNode;
  final TextCapitalization textCapitalization;
  final int? minLines, maxLength;
  final TextAlign textAlign;
  final ToolbarOptions? toolbarOptions;
  final SmartDashesType? smartDashesType;
  final SmartQuotesType? smartQuotesType;
  final TextStyle? style;
  final StrutStyle? strutStyle;
  final ScrollPhysics? scrollPhysics;
  final TextAlignVertical? textAlignVertical;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final Brightness? keyboardAppearance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: TextFormField(
          controller: TagtlyManager.controller,
          autocorrect: autocorrect!,
          enableSuggestions: enableSuggestions!,
          onChanged: onChanged,
          onTap: onTap,
          obscureText: obscureText!,
          onFieldSubmitted: (String val) => onFieldSubmitted!.call(val),
          obscuringCharacter: obscuringCharacter!,
          onEditingComplete: () => onEditingComplete!.call(),
          onSaved: (String? val) => onSaved!.call(val),
          readOnly: readOnly!,
          decoration: decoration,
          selectionControls: selectionControls,
          keyboardType: keyboardType,
          textDirection: textDirection,
          textInputAction: textInputAction,
          scrollPadding: scrollPadding,
          autofillHints: autofillHints,
          autofocus: autofocus!,
          autovalidateMode: autoValidateMode,
          buildCounter: buildCounter,
          cursorColor: cursorColor,
          cursorHeight: cursorHeight,
          cursorRadius: cursorRadius,
          cursorWidth: cursorWidth,
          showCursor: showCursor,
          focusNode: focusNode,
          keyboardAppearance: keyboardAppearance,
          scrollController: scrollController,
          maxLengthEnforcement: maxLengthEnforcement,
          scrollPhysics: scrollPhysics,
          textAlignVertical: textAlignVertical,
          style: style,
          smartDashesType: smartDashesType,
          smartQuotesType: smartQuotesType,
          strutStyle: strutStyle,
          minLines: minLines,
          enableIMEPersonalizedLearning: enableIMEPersonalizedLearning,
          expands: expands!,
          inputFormatters: inputFormatters,
          restorationId: restorationId,
          toolbarOptions: toolbarOptions,
          enabled: enabled,
          textAlign: textAlign,
          maxLength: maxLength,
          initialValue: initialValue,
          validator: validator,
          maxLines: minLines,
          enableInteractiveSelection: enableInteractiveSelection!,
          textCapitalization: textCapitalization,
        ),
      ),
    );
  }
}
