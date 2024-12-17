
import 'package:schools_map/config/core/exports.dart';

import '../../../../config/services/funcs/keyboard.dart';
import 'ready_input_base.dart';

class PhoneInput extends StatefulWidget {
  final String tag;
  final IconData iconD;
  final Widget? prefix;
  final String label;
  final String startVal;
  final String? Function()? validator;
  final bool readOnly;
  final bool autofocus;
  final EdgeInsetsGeometry? padding;
  final void Function(String value)? onChanged;
  final Function? onEditingComplete;
  const PhoneInput({
    super.key,
    this.validator,
    this.startVal = "",
    this.prefix,
    required this.tag,
    this.padding = const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
    this.iconD = Icons.edit,
    this.label = "",
    this.onChanged,
    this.onEditingComplete,
    this.readOnly = false,
    this.autofocus = true,
  });

  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
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
    final tc=TC(context);
    return TextFormField(
      autofocus: widget.autofocus,
      readOnly: widget.readOnly,
      controller: RIBase.getControl(widget.tag),
      style: tc.texts
          .bodyText('')
          .style!
          .copyWith(color: const Color(0xff2E2F37)),
      maxLength: 8,
      keyboardType: TextInputType.phone,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintTextDirection: TextDirection.rtl,
        counter: const Offstage(),
        // un show label
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: '+993 ',
        contentPadding: widget.padding,
        prefix:
         tc.texts.bodyText('+993 ', col: const Color(0xff2E2F37)),
        border: InputBorder.none,
      ),
      validator: (String? value) {
        if (widget.validator != null) return widget.validator!();
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
