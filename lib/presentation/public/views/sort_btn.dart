import 'package:schools_map/config/core/exports.dart';

class SortBtn extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  const SortBtn({
    this.onTap,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleWidget(
        rad: 32,
        col: color?.withOpacity(0.2),
        child: SvgPicture.asset(
          Asset.svgs.sort,
          color: color,
        ),
      ),
    );
  }
}
