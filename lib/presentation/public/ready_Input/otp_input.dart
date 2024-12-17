// ignore_for_file: must_be_immutable


import 'package:flutter/services.dart';

import '../../../config/core/exports.dart';
import 'ready_input_base.dart';

class OTPInput extends StatefulWidget {
  final int inputCount;
  final String tag;
  final double? w;
  final double? h;
  String? startVal;
  final String? Function()? validator;
  final void Function(String value)? onChanged;
  final Function? onEditingComplete;
  OTPInput({
    this.inputCount = 6,
    this.validator,
    this.w,
    this.h,
    required this.tag,
    this.startVal,
    this.onChanged,
    this.onEditingComplete,
    super.key,
  });

  @override
  State<OTPInput> createState() => _OTPInputState();
}

class _OTPInputState extends State<OTPInput> {
  late TextEditingController control;

  @override
  void initState() {
    widget.startVal = fillText(widget.startVal ?? '');
    RIBase.changeDate(widget.tag, TextEditingController(text: widget.startVal));
    super.initState();
  }

  String fillText(String text) {
    return text.padRight(widget.inputCount, ' ');
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(widget.inputCount, (index) {
        if (index == 0) {
          return OTPDigitTextFieldBox(
            first: true,
            last: false,
            index: 0,
            tag: widget.tag,
            validator: widget.validator,
            onChanged: widget.onChanged,
          );
        } else if (index == widget.inputCount - 1) {
          return OTPDigitTextFieldBox(
            first: false,
            last: true,
            index: index,
            tag: widget.tag,
            validator: widget.validator,
            onChanged: widget.onChanged,
          );
        }
        return OTPDigitTextFieldBox(
          first: false,
          last: false,
          index: index,
          tag: widget.tag,
          validator: widget.validator,
          onChanged: widget.onChanged,
        );
      })
          .map((e) => Container(
              alignment: Alignment.center,
              width: widget.w,
              height: widget.h,
              child: e))
          .toList(),
    );
  }
}

class OTPDigitTextFieldBox extends StatelessWidget {
  final bool first;
  final bool last;
  final int index;
  final String? Function()? validator;
  final void Function(String value)? onChanged;
  final String tag;

  const OTPDigitTextFieldBox({
    super.key,
    required this.first,
    required this.last,
    this.validator,
    this.onChanged,
    required this.index,
    required this.tag,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (validator != null) return validator!();
        return null;
      },
      autofocus: true,
      onChanged: (value) {
        if (value.length == 1 && last == false) {
          FocusScope.of(context).nextFocus();
        }
        if (value.isEmpty && first == false) {
          FocusScope.of(context).previousFocus();
        }
        String text = RIBase.getText(tag);
        text = text.replaceRange(index, index + 1, value.isEmpty ? ' ' : value);
        RIBase.changeDate(tag, TextEditingController(text: text));
        if (onChanged != null) onChanged!(text);
      },
      showCursor: false,
      textAlign: TextAlign.center,
      textAlignVertical: TextAlignVertical.center,
      style: TC(context).texts.heading3('').style,
      keyboardType: TextInputType.number,
      maxLength: 1,
      minLines: 1,
      maxLines: 1,
      decoration: const InputDecoration(
        counter: SizedBox(),
        contentPadding: EdgeInsets.all(0),
        errorStyle: TextStyle(fontSize: 0),
      ),
      inputFormatters: [
        LengthLimitingTextInputFormatter(1),
        FilteringTextInputFormatter.digitsOnly,
      ],
    );
  }
}
