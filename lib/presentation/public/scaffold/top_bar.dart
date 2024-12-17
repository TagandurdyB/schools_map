// ignore_for_file: must_be_immutable

import '../../../config/core/exports.dart';

class TopBar extends StatelessWidget {
  final bool isAbout, isSearch;
  final void Function()? onSearch;
  final void Function()? onBack;
  TopBar({
    this.isAbout = true,
    this.isSearch = true,
    this.onSearch,
    this.onBack,
    super.key,
  });

  late TC tc;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    tc = TC(context);
    this.context = context;
    return Container(
      color: tc.cols.canvas,
      child: Column(
        children: [
          Container(
            // color: Colors.red,
            alignment: Alignment.center,
            height: kToolbarHeight,
            child: Stack(
              fit: StackFit.expand,
              alignment: Alignment.center,
              children: [
                // MyImage(
                // imgPath: tc.isLight ? Asset.logoLight : Asset.logoDark,
                //   type: FileType.asset,
                //   h: kToolbarHeight,
                // ),
                SizedBox(
                  height: kToolbarHeight,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyImage(
                        imgPath: tc.isLight
                            ? Asset.svgs.newMainlogo
                            : Asset.logoDark,
                        type: FileType.svg,
                        h: kToolbarHeight,
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 10),
                      //   child: SvgPicture.asset(Asset.svgs.logo),
                      // ),
                      // SvgPicture.asset(Asset.svgs.textLogo),
                    ],
                  ),
                ),
                onBack == null
                    ? const SizedBox()
                    : Positioned(
                        left: 0,
                        child: BackButton(
                          onPressed: onBack,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
