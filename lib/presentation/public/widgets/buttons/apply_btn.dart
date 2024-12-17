// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:schools_map/config/core/exports.dart';

class ApplyBtn extends StatelessWidget {
  final String text;
  final MapEntry<Color?, Color?> colors;
  final void Function()? func;
  final EdgeInsetsGeometry? pad;
  final Alignment? align;
  const ApplyBtn({
    Key? key,
    required this.text,
    required this.colors,
    this.func,
    this.pad = const EdgeInsets.all(16),
    this.align = Alignment.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      
      child: InCard(
        rad: 50,
        
        pad: pad,
        align: align,
        col: colors.key,
        child: cc.texts.bodyTextBold(
          text,
          col: colors.value,
        ),
      ),
    );
  }
}
