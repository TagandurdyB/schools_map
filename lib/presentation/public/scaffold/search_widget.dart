import '../../../config/core/exports.dart';

class SearchWidget extends StatelessWidget {
  final String? startVal;
  final void Function()? onTap;
  const SearchWidget({
    this.startVal,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    cc=TC(context);
    return GestureDetector(
      // onTap: onTap ?? () => Go.to(Go.search, argument: {'tag': 'home'}),
      child: Hero(
        tag: "${RInput.search}home",
        child: Material(
          child: InCard(
            border: Border.all(width: 1, color: cc.cols.grey200),
            rad: 100,
            h: 45,
            pad: const EdgeInsets.all(6),
            child: Row(
              children: [
                CirculeIcon(
                  iconD: Icons.search,
                ),
                const SizedBox(width: 10),
                Expanded(
                    child: cc.texts.bodyText(
                  startVal ?? 'Search ...',
                  col: cc.cols.grey70,
                )),
                if (startVal != null)
                  // CirculeIcon(
                  //   iconD: Icons.close,
                  // ),
                  SvgPicture.asset(Asset.svgs.close),
                // CirculeIcon(
                //   iconD: Icons.camera_alt_outlined,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
