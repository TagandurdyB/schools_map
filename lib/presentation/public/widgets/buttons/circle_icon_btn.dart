import 'package:schools_map/config/core/exports.dart';

// ignore: must_be_immutable
class CirculeIcon extends StatelessWidget {
  MapEntry<Color, Color>? colors;
  final IconData iconD;
  final void Function()? onTap;
  final double radius;
  final double size;

  CirculeIcon({
    Key? key,
    this.colors,
    this.radius = 32,
    this.size = 20,
    required this.iconD,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return onTap == null
        ? buildChild()
        : GestureDetector(
            onTap: onTap,
            child: buildChild(),
          );
  }

  Widget buildChild() {
    colors ??= MapEntry(cc.cols.orange70, cc.cols.orange300);
    return CircleWidget(
      rad: radius,
      col: colors!.key,
      child: Icon(
        iconD,
        color: colors!.value,
        size: size,
      ),
    );
  }
}
