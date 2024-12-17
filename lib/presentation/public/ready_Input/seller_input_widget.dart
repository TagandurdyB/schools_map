// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/services.dart';
import 'package:schools_map/config/core/exports.dart';
import 'package:schools_map/config/theme/my_theme.dart';

import 'input_widget.dart';

class SellerInputWidget extends StatelessWidget {
  final TC tc;
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
  const SellerInputWidget({
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
    required this.tc,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme:
            MyTheme.inputTheme(8, tc.cols, fillColor: tc.cols.alabaster),
      ),
      child: InputWidget(
        validator: validator,
        startVal: startVal,
        hidden: hidden,
        prefix: prefix,
        suffix: suffix,
        controller: controller,
        tag: tag,
        padding: padding,
        iconD: iconD,
        label: label,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onTap: onTap,
        readOnly: readOnly,
        autoFocus: autoFocus,
        maxLines: maxLines,
        maxLength: maxLength,
        type: type,
        formatters: formatters,
        style: style,
        inputAction: inputAction,
        isDense: isDense,
        textAlign: textAlign,
      ),
    );
  }
}
