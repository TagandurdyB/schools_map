import 'package:schools_map/config/core/exports.dart';

class FilterBtn extends StatelessWidget {
  final Function()? onTap;
  final Color? color;
  const FilterBtn({
    this.onTap,
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleWidget(
        rad: 32,
        col: color?.withOpacity(0.2),
        child: SvgPicture.asset(
          Asset.svgs.filter,
          // ignore: deprecated_member_use
          color: color,
        ),
      ),
    );
  }
}
