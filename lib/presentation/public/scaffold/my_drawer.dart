// ignore_for_file: must_be_immutable

import 'package:schools_map/config/core/exports.dart';

class MyDrawer extends StatelessWidget {
  MyDrawer({super.key});

  late TC tc;
  late BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    tc = TC(context);
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            buildTop(),
            SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  buildDrawerItem(
                    Icons.favorite_border,
                    'In wishlist',
                    () {
                      // Go.to(Go.favotire);
                    },
                    // count: Boxes.products.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDrawerItem(
    IconData iconD,
    String text,
    Function() func, {
    int? count,
  }) {
    return GestureDetector(
      onTap: func,
      child: Container(
        color: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconD, color: tc.cols.orange200),
            const SizedBox(width: 8),
            Expanded(
              child: tc.texts.bodyTextBold(
                text,
                col: tc.cols.grey100,
                size: 20,
              ),
            ),
            count == null || count == 0
                ? const SizedBox()
                : InCard(
                    w: 60,
                    align: Alignment.center,
                    pad: const EdgeInsets.all(4),
                    col: tc.cols.canvas2,
                    child: tc.texts.bodyText('$count'),
                  ),
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    return Row(
      children: [
        Expanded(
          child: MyImage(
            imgPath: tc.isLight ? Asset.logoLight : Asset.logoDark,
            type: FileType.asset,
          ),
        ),
        // buildLangChanger(tc.lang),
        const SizedBox(width: 4),
        buildModeChanger()
      ],
    );
  }

  Widget buildModeChanger() {
    return InCard(
        pad: const EdgeInsets.all(6),
        col: tc.cols.canvas2,
        child: GestureDetector(
          onTap: () {
            context.read<ThemeCubit>().changeLight(!tc.isLight);
          },
          child: tc.isLight
              ? const Icon(Icons.dark_mode)
              : const Icon(Icons.light_mode_outlined),
        ));
  }

  // PopupMenuButton<Lang> buildLangChanger(MapEntry lang) {
  //   return PopupMenuButton<Lang>(
  //     shape: const RoundedRectangleBorder(
  //         borderRadius: BorderRadius.all(Radius.circular(15.0))),
  //     itemBuilder: (context) => Lang.values
  //         .map((e) => PopupMenuItem(
  //               value: e,
  //               child: InCard(
  //                 rad: 8,
  //                 col: lang == e ? tc.cols.canvas2 : null,
  //                 pad: const EdgeInsets.symmetric(
  //                   horizontal: 16,
  //                   vertical: 8,
  //                 ).copyWith(bottom: 4),
  //                 child: Row(children: [
  //                   buildLangBox(e),
  //                   const SizedBox(width: 8),
  //                   tc.texts.bodyText(e.value),
  //                 ]),
  //               ),
  //             ))
  //         .toList(),
  //     child: buildLangBox(lang),
  //     onSelected: (value) => context.read<ThemeCubit>().changeLang(value),
  //   );
  // }

  // Widget buildLangBox(MapEntry lang) {
  //   return buildBoard(
  //     ClipOval(
  //       child: SizedBox(
  //         height: 26,
  //         width: 26,
  //         child: Image.asset(ThemeCubit.flagPath(lang)),
  //       ),
  //     ),
  //   );
  // }

  Widget buildBoard(Widget child) {
    return InCard(
        rad: 8,
        col: tc.cols.canvas2,
        pad: const EdgeInsets.all(4),
        child: child);
  }
}
