import 'package:flutter/services.dart';
import '../../../../config/core/exports.dart';

// part 'card_input_format.dart';
//
class InputWidget2 extends StatefulWidget {
  final String tag;
  final IconData iconD;
  final Widget? prefix;
  final Widget? suffix;
  final String label;
  final String startVal;
  final String hidden;
  final TextEditingController? controller;
  final String? Function()? validator;
  final bool readOnly;
  final EdgeInsetsGeometry? padding;
  final void Function(String value)? onChanged;
  final Function()? onEditingComplete;
  final Function()? onTap;
  final TextInputType type;
  final bool autoFocus;
  final int maxLines;
  final int? maxLength;
  final List<TextInputFormatter>? formatters;
  final TextStyle? style;
  final TextInputAction? inputAction;
  final TextAlign textAlign;
  final bool isDense;
  const InputWidget2({
    super.key,
    this.validator,
    this.startVal = "",
    this.hidden = "",
    this.prefix,
    this.suffix,
    this.controller,
    required this.tag,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    this.iconD = Icons.edit,
    this.label = "",
    this.onChanged,
    this.onEditingComplete,
    this.onTap,
    this.readOnly = false,
    this.autoFocus = false,
    this.maxLines = 1,
    this.maxLength,
    this.type = TextInputType.text,
    this.formatters,
    this.style,
    this.inputAction,
    this.isDense = false,
    this.textAlign = TextAlign.start,
  });

  @override
  State<InputWidget2> createState() => _InputWidget2State();
}

class _InputWidget2State extends State<InputWidget2> {
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    RIBase.changeDate(widget.tag, TextEditingController(text: widget.startVal));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildFormInput(),
      ],
    );
  }

  Widget buildFormInput() {
    final tc = TC(context);
    if (widget.controller != null) {
      RIBase.changeDate(widget.tag, widget.controller!);
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: errorMessage != null,
          child: tc.texts.smallBodyText(
            "   ${errorMessage ?? ''}",
            col: Colors.red,
          ),
        ),
        if (widget.label.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 14, bottom: 4),
            child: tc.texts.bodyText(widget.label),
          ),
        TextFormField(
          textAlign: widget.textAlign,
          // cursorColor: Colors.orange,
          inputFormatters: widget.formatters ?? [],
          textCapitalization: TextCapitalization.sentences,
          autofocus: widget.autoFocus,
          readOnly: widget.readOnly,
          controller: widget.controller ?? RIBase.getControl(widget.tag),
          style: widget.style ??
              tc.texts.style
                  .bodyText, //.copyWith(color: const Color(0xff2E2F37)),
          maxLength: widget.maxLength,
          maxLines: widget.maxLines,
          keyboardType: widget.type,
          textInputAction: widget.inputAction,
          obscureText: widget.type == TextInputType.visiblePassword,
          obscuringCharacter: "*",
          textAlignVertical: TextAlignVertical.center,

          decoration: InputDecoration(
            hintText: widget.hidden,
            hintStyle:
                tc.texts.bodyText('').style!.copyWith(color: tc.cols.grey80),
            // hintTextDirection: TextDirection.rtl,
            counter: const Offstage(),
            // un show label
            floatingLabelBehavior: FloatingLabelBehavior.never,
            // labelText: '+993 ',
            isDense: widget.isDense,
            contentPadding: widget.maxLines == 1
                ? widget.padding
                : const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            errorStyle: const TextStyle(fontSize: 0),
            prefixIcon: widget.prefix,
            suffixIcon: widget.suffix,
            //     Texts(context).placeholder('+993 ', col: const Color(0xff2E2F37)),
            border: InputBorder.none,
          ),
          validator: (String? value) {
            if (widget.validator != null) {
              setState(() => errorMessage = widget.validator!());
              return errorMessage;
            }
            return null;
          },
          onChanged: (value) {
            if (widget.onChanged != null) widget.onChanged!(value);
          },
          onEditingComplete: () {
            Keyboard.close(context);
            if (widget.onEditingComplete != null) widget.onEditingComplete!();
          },
          onTap: widget.onTap,
        ),
      ],
    );
  }
}
