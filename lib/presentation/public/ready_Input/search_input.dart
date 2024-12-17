import 'package:flutter/material.dart';

import '../../../../../config/services/funcs/keyboard.dart';

import '../../cubits/theme/theme_cubit.dart';
import 'ready_input_base.dart';

class SearchInput extends StatefulWidget {
  final String tag;
  final String startVal;
  final String hidden;
  final Function? onTap;
  final Function? onEditingComplete;
  final Function(String value)? onChanged;
  final FocusNode? focus;
  final Widget? prefix;
  final IconData? iconD;
  final bool autoFocus;
  final Color? textCol;
  final Color focusBorderColor;
  const SearchInput(
      {required this.tag,
      this.prefix,
      this.iconD = Icons.search,
      this.startVal = "",
      this.hidden = "",
      this.onTap,
      this.onEditingComplete,
      this.onChanged,
      this.focus,
      this.autoFocus = false,
      this.textCol = Colors.green,
      this.focusBorderColor = Colors.green,
      super.key});

  @override
  State<SearchInput> createState() => _SearchInputState();
}

class _SearchInputState extends State<SearchInput> {
  @override
  void initState() {
    super.initState();
    RIBase.changeDate(widget.tag, TextEditingController(text: widget.startVal));
  }

  final double borderRad = 7;
  final double enableWidth = 1;
  final double focusWidth = 2;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autoFocus,
      controller: RIBase.getControl(widget.tag),
      onTap: () {
        if (widget.onTap != null) widget.onTap!();
      },
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
      },
      onEditingComplete: () {
        Keyboard.close(context);
        if (widget.onEditingComplete != null) widget.onEditingComplete!();
      },
      focusNode: widget.focus,
      style: TC(context).texts.bodyText('').style,
      decoration: InputDecoration(
        hintText: widget.hidden,
        hintStyle: const TextStyle(color: Color(0xffC4C4C4)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        prefix:const Padding(
          padding: EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        ),
          //  widget.prefix ?? (widget.iconD != null ? Icon(widget.iconD) : null),
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRad)),
            borderSide: BorderSide(color: Colors.grey, width: enableWidth)),
      ),
    );
  }
}
