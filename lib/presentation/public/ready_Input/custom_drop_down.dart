// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:schools_map/config/core/exports.dart';

import '../../../config/theme/my_theme.dart';

class CustomDropDown<T> extends StatefulWidget {
  final void Function(T?)? onChanged;
  final List<DropdownMenuItem<T>>? items;
  final String? Function(T?)? validator;
  final TC tc;
  final Widget? hint;
  T? value;
  bool isExpanded;
  List<Widget> Function(BuildContext)? selectedItemBuilder;
  CustomDropDown({
    Key? key,
    required this.onChanged,
    required this.items,
    required this.tc,
    this.validator,
    this.hint,
    this.value,
    this.selectedItemBuilder,
    this.isExpanded = true,
  }) : super(key: key);

  @override
  State<CustomDropDown<T>> createState() => _CustomDropDownState<T>();
}

class _CustomDropDownState<T> extends State<CustomDropDown<T>> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        inputDecorationTheme: MyTheme.inputTheme(
          8,
          widget.tc.cols,
          fillColor: widget.tc.cols.alabaster,
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButtonFormField(
          isExpanded: widget.isExpanded,
          items: widget.items, 
          selectedItemBuilder: widget.selectedItemBuilder,
          value: widget.value,
          hint: widget.hint,
          validator: widget.validator,
          onChanged: widget.onChanged,
        ),
      ),
    );
  }
}
