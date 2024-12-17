// ignore_for_file: public_member_api_docs, sort_constructors_first

import '../../../config/core/exports.dart';

class CustomBar extends StatelessWidget {
  final String title;
  final Function()? onBack;
  const CustomBar({
    Key? key,
    required this.title,
    this.onBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight,
      decoration: BoxDecoration(
        color: cc.cols.canvas,
        // boxShadow: cc.shadow.greyCard,
        border: Border(bottom: BorderSide(width: 1, color: cc.cols.canvas2)),
      ),
      child: Stack(alignment: Alignment.center, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            cc.texts.buttonText(title),
          ],
        ),
        if (onBack != null)
          Positioned(
            left: 9,
            child: GestureDetector(
              onTap: () => Go.pop(),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
      ]),
    );
  }
}
