import 'package:schools_map/config/core/exports.dart';

class InBtn extends StatelessWidget {
  final String text;
  final Color? col;
  final double rad;
  final void Function()? onTap;
  final Widget? child;
  final EdgeInsetsGeometry? pad;
  final Alignment? align;
  final double? size;
  const InBtn({
    this.text = 'Button',
    this.child,
    this.col,
    this.rad = 4.0,
    this.onTap,
    this.align,
    this.pad = const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tc = TC(context);
    return GestureDetector(
      onTap: onTap,
      child: InCard(
        align: align,
        pad: pad,
        rad: rad,
        col: col ?? tc.cols.grey200,
        child: child ?? tc.texts.bodyText(text, col: Colors.white, size: size),
      ),
    );
  }
}
