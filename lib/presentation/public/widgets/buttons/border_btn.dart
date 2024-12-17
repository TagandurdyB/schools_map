import 'package:schools_map/config/core/exports.dart';

class BorderBtn extends StatelessWidget {
  final String text;
  final Color color;
  final double bRadius;
  final TextStyle? style;
  final EdgeInsetsGeometry? padding;
  final Function()? onTap;
  final Alignment? align;
  final Widget? child; 
  const BorderBtn({
    this.text = "Şikaýat et",
    this.color = const Color(0xffE50027),
    this.bRadius = 10,
    this.style,
    this.padding,
    this.align = Alignment.center,
    this.onTap,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: padding ?? const EdgeInsets.all(15),
        alignment: align,
        decoration: BoxDecoration(
            border: Border.all(color: color, width: 1),
            borderRadius: BorderRadius.circular(bRadius)),
        child:child??
            Text(text, style: style ?? TextStyle(fontSize: 18, color: color)),
      ),
    );
  }
}
