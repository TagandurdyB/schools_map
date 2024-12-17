import 'package:schools_map/config/core/exports.dart';

class EmptyWidget extends StatelessWidget {
  final Function()? onTap;
  final String? description;
  final IconData? iconD;
  const EmptyWidget({
    this.onTap,
    this.iconD,
    this.description,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tc = TC(context);
    return SizedBox(
        // height: 70,
        child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconD != null)
            CircleWidget(
              rad: 80,
              col: tc.cols.orange60,
              child: Icon(iconD, color: tc.cols.orange400, size: 32),
            ),
          tc.texts.heading3('Boş'),
          Visibility(
            visible: description != null,
            child: tc.texts.bodyText(
              description ?? '',
              col:  tc.cols.orange400, //tC.cols.sharpSwatch[600],
            ),
          ),
          Visibility(
            visible: onTap != null,
            child: Padding(
              padding: const EdgeInsets.only(top: 16),
              child: GestureDetector(
                onTap: onTap,
                child: InCard(
                  col: tc.cols.orange300,
                  pad: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child:
                      tc.texts.buttonText("Try again", col: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
