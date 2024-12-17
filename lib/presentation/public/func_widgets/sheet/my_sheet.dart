import 'package:schools_map/config/core/exports.dart';

part 'sheet_data_view.dart';

class MySheet {
  static Future loadingModal() async {
    return showDialog(
      context: AppRoute.context,
      barrierDismissible: false,
      builder: (context) {
        return const Center(
          child: InCard(
              w: 150, h: 150, align: Alignment.center, child: LoadingWidget()),
        );
      },
    );
  }

  static Future show(
    BuildContext context,
    Widget child, {
    bool isDismissible = false,
  }) async {
    return showModalBottomSheet(
      isDismissible: isDismissible,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (context) => Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 600,
            child: Column(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => Go.pop(),
                    child: Container(
                      color: Colors.transparent,
                    ),
                  ),
                ),
                child,
              ],
            ),
          )),
      // Padding(
      //   padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      //   child: child),
    );
  }

  static Future<bool> dataView(
    BuildContext context, {
    Key? key,
    String title = '',
    bool search = false,
    double? height,
    required List<SheetObj> objs,
    final void Function(SheetObj obj)? onChange,
  }) {
    return show(
      context,
      SheetDataView(
        key: key,
        title: title,
        search: search,
        objs: objs,
        onChange: onChange,
        height: height,
      ),
    ).then((value) => value?.first ?? false);
  }
}
