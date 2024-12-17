


import 'package:schools_map/config/core/exports.dart';

class NextBtn extends StatelessWidget {
  final String text;
  final Color color;
  final Widget? ch;
  final double bRadius;
  final EdgeInsetsGeometry? padding;
  final Function? onTap;
  const NextBtn(
      {this.text = "Inniki",
      this.color = Colors.orange,
      this.ch,
      this.bRadius = 10,
      this.padding,
      this.onTap,
      super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onTap != null) onTap!();
      },
      child: Container(
        padding: padding ?? const EdgeInsets.all(15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(bRadius)),
        child: ch ??
            Text(text,
                style: const TextStyle(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}
