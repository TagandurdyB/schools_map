// ignore_for_file: must_be_immutable

import 'package:schools_map/presentation/public/scaffold/navigation/routes/nav_route.dart';

import '../../../../config/core/exports.dart';

class BottomNavigation extends StatelessWidget {
  int currentIndex;
  final void Function(int index)? onChange;
  // final List<CategoryEntity> categories;
  final bool isTablet;
  BottomNavigation({
    required this.currentIndex,
    // required this.categories,
    this.onChange,
    this.isTablet = false,
    super.key,
  });

  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return buildBottom();
  }

  Widget buildBottom() {
    cc = TC(context);
    return Container(
      decoration: BoxDecoration(
        color: cc.cols.canvas,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
          )
        ],
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewPadding.bottom,
      ),
      // child: isTablet
      //     ? SingleChildScrollView(
      //         child: Column(
      //           children: buildCategories(),
      //         ),
      //       )
      //     : SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: buildCategories(),
      //         ),
      //       ),
      child: Row(
        children: [
          Expanded(child: buildHistoryCard(0, 'Sanaw', Icons.list_alt_rounded)),
          Expanded(child: buildHistoryCard(1, 'Karta', Icons.location_on_outlined)),
        ],
      ),
    );
  }

  Widget buildHistoryCard(int index, String text, IconData iconD) {
    final isActive = currentIndex == index;
    return GestureDetector(
      onTap: () {
        if (onChange != null) {
          onChange!(index);
        }
      },
      child: Container(
        color: isActive ? cc.cols.blue100 : cc.cols.canvas,
        width: 100,
        // height: 100,
        child: Column(
          children: [
            const SizedBox(height: 6),
            Icon(
              iconD,
              size: 30,
              color: isActive ? Colors.white : null,
            ),
            const SizedBox(height: 8),
            cc.texts.bodyText(
              text,
              size: 14,
              col: isActive ? Colors.white : null,
            ),
            const SizedBox(height: 6),
          ],
        ),
      ),
    );
  }

  // Widget buildItemCard(int index) {
  //   final obj = categories[index - 1];
  //   final isActive = currentIndex == index;
  //   return Container(
  //     color: isActive ? cc.cols.orange200 : null,
  //     width: 100,
  //     // height: 100,
  //     child: Column(
  //       children: [
  //         MyImage(
  //           imgPath: obj.image?.path ?? '',
  //           source: obj.image?.source ?? FileSource.err,
  //           w: 60,
  //           h: 60,
  //         ),
  //         const SizedBox(height: 8),
  //         cc.texts.bodyText(
  //           obj.name,
  //           size: 14,
  //           col: isActive ? Colors.white : null,
  //         ),
  //         const SizedBox(height: 16),
  //       ],
  //     ),
  //   );
  // }

  Widget buildBottomIcon(MapEntry item, TC tc, int index) {
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.topRight,
        children: [
          Column(
            children: [
              // MyCont(
              // col: isActive
              //       ? tc.cols.navigatActiveIconBg
              //       : tc.cols.navigatUnactiveIconBg,
              // col: isActive ? Colors.blue : Colors.black12,
              // rad: 12,
              // pad: const EdgeInsets.all(8),
              // ch: item.value,
              // ),
              item.value,
              // isActive
              //     ? tc.texts.bodyTextBold(
              //         item.key,
              //         col: tc.cols.navigatActiveIcon,
              //         maxLines: 2,
              //         size: 14,
              //       )
              //     : tc.texts.bodyText(
              //         item.key,
              //         col: tc.cols.navigatUnactiveIcon,
              //         maxLines: 2,
              //         size: 14,
              //       ),
            ],
          ),
        ]);
  }
}
