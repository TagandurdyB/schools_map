import 'package:flutter/material.dart';

import '../../../../config/services/funcs/keyboard.dart';
import 'ready_input_base.dart';

class CoolInput extends StatefulWidget {
  final TextInputType type;
  final String tag;
  final String hidden;
  final IconData iconD;
  final Widget? prefix;
  final String label;
  final String startVal;
  final String? Function(String? value)? validator;
  final int? maxLength;
  final int maxLines;
  final bool readOnly;
  final bool enableLabel;
  final bool disableLabel;
  final EdgeInsetsGeometry? padding;
  final void Function(String)? onChanged;
  final Function? onEditingComplete;
  const CoolInput({
    super.key,
    this.maxLength,
    this.maxLines = 1,
    this.validator,
    this.startVal = "",
    this.hidden = "",
    this.prefix,
    this.type = TextInputType.text,
    required this.tag,
    this.padding,
    this.iconD = Icons.edit,
    this.label = "",
    this.enableLabel = false,
    this.disableLabel = false,
    this.onChanged,
    this.onEditingComplete,
    this.readOnly = false,
  });

  @override
  State<CoolInput> createState() => _CoolInputState();
}

class _CoolInputState extends State<CoolInput> {
  bool isPassShow = false;
  final FocusNode focusNode = FocusNode();
  bool isFocus = false;
  bool isEmpty = true;
  Color enableBorderColor = Colors.grey;
  Color focusBorderColor =  Colors.blue;

  @override
  void initState() {
    super.initState();
    RIBase.changeDate(widget.tag, TextEditingController(text: widget.startVal));
    RIBase.getControl(widget.tag).addListener(() => setState(() {
          isEmpty = RIBase.isEmpety(widget.tag);
        }));
    focusNode.addListener(() {
      setState(() {
        // borderColor = focusNode.hasFocus ? Colors.orange : Colors.grey;
        isFocus = focusNode.hasFocus ? true : false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         widget.disableLabel ? const SizedBox() : 
        Visibility(
          visible:
              widget.enableLabel || widget.label != "" && (isFocus || !isEmpty),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            //color: borderColor,
            width: double.infinity,
            // height: 20,
            child: Text(
                widget.enableLabel || isFocus || !isEmpty ? widget.label : ""),
          ),
        ),
        buildFormInput(),
      ],
    );
  }

  Widget buildFormInput() {
    final themeInput = Theme.of(context).inputDecorationTheme;
    enableBorderColor = (isEmpty ? Colors.grey : themeInput.focusColor)!;
    return TextFormField(
      readOnly: widget.readOnly,
      maxLines: widget.maxLines,
      controller: RIBase.getControl(widget.tag),
      focusNode: focusNode,
      obscureText: widget.type == TextInputType.visiblePassword && !isPassShow,
      obscuringCharacter: "*",
      style: TextStyle(
          // color: Colors.black,
          color: themeInput.hoverColor,
          fontSize: 16,
          letterSpacing: 1,
          decoration: TextDecoration.none,
          overflow: TextOverflow.visible,
          decorationStyle: TextDecorationStyle.dotted,
          decorationColor: Colors.white),
      // enableSuggestions: false,
      // decoration: const InputDecoration(
      //   border: InputBorder.none,
      // ),

      maxLength: widget.type == TextInputType.phone ? 8 : widget.maxLength,
      keyboardType: widget.type,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        counter: const Offstage(),
        // un show label
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: widget.hidden,
        // floatingLabelAlignment: FloatingLabelAlignment.center,
        alignLabelWithHint: true,
        contentPadding: widget.padding ??
            const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        labelStyle: const TextStyle(color: Colors.grey),
        errorStyle: const TextStyle(height: 0),
        prefixIcon: widget.prefix == null ? Icon(widget.iconD) : null,
        prefix: widget.prefix,
        prefixIconColor: enableBorderColor,
        suffixIcon: widget.type == TextInputType.visiblePassword
            ? GestureDetector(
                onTap: () => setState(() => isPassShow = !isPassShow),
                child: Icon(isPassShow
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined))
            : null,
        suffixIconColor: enableBorderColor,
        //  labelText: widget.label,
        // border: const OutlineInputBorder(
        //     borderSide: BorderSide(color: Colors.grey)),
        // remove under line
        border: InputBorder.none,
        // focusColor: Colors.orange,
        focusedBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: focusBorderColor)),
        enabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: enableBorderColor)),
        errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red)),
        focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            borderSide: BorderSide(color: Colors.red)),
      ),

      validator: (String? value) {
        if (widget.validator != null) return widget.validator!(value);
        return null;
      },
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      onEditingComplete: () {
        Keyboard.close(context);
        if (widget.onEditingComplete != null) widget.onEditingComplete!();
      },
    );
  }
}
