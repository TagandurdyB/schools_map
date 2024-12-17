import 'package:schools_map/config/core/exports.dart';

class SearchBtn extends StatelessWidget {
  final Function()? onTap;
  const SearchBtn({
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(Asset.svgs.search),
    );
  }
}
