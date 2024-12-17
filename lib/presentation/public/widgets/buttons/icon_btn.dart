

import 'package:schools_map/config/core/exports.dart';

class IconBtn extends StatelessWidget {
  final String text;
  final Color bg;
  final Color col;
  final Widget? ch;
  final double bRadius;
  final IconData? iconD;
  final Function()? onTap;
  const IconBtn(
      {this.text = "",
      this.bg = const Color(0xffEFF5FF),
      this.col = const Color(0xff3F7CF2),
      this.ch,
      this.bRadius = 10,
      this.onTap,
      this.iconD,
      super.key});

  @override
  Widget build(BuildContext context) {
    return onTap == null
        ? buildCard()
        : GestureDetector(
            onTap: () => onTap!(),
            child: buildCard(),
          );
  }

  Widget buildCard() {
    return MyCont(
      pad: const EdgeInsets.all(5),
      rad: bRadius,
      col: bg,
      ch: ch ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconD, color: col, size: 20),
              // Tex(text, col: col),
              Text(
                text,
                style: TextStyle(color: col),
              ),
            ],
          ),
    );
  }
}
