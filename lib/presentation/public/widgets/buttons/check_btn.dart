// ignore_for_file: must_be_immutable

import '../../../../config/core/exports.dart';

class CheckBtn extends StatelessWidget {
  CheckBtn({
    super.key,
    required this.onChack,
    required this.isCheck,
    this.replaceCol = false,
    this.text = '',
    this.padd = const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
    this.colors,
  });

  final void Function(bool val)? onChack;
  final bool isCheck;
  final bool replaceCol;
  final String text;
  final EdgeInsetsGeometry padd;
  MapEntry<Color, Color>? colors;

  @override
  Widget build(BuildContext context) {
    final tc = TC(context);
    colors ??= MapEntry(tc.cols.grey90, tc.cols.orange200);
    return GestureDetector(
      onTap: () {
        if (onChack != null) onChack!(isCheck);
      },
      child: Row(
        children: [
          Container(
            color: Colors.transparent,
            padding: padd,
            child: MyCont(
              col: isCheck
                  ? replaceCol
                      ? colors!.key
                      : colors!.value
                  : Theme.of(context).canvasColor,
              // marg: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              w: 24,
              h: 24,
              borderW: isCheck ? 0 : 1,
              borderC: isCheck ? colors!.value : colors!.key,
              rad: 4,
              ch: isCheck
                  ? Icon(
                      Icons.check,
                      color: replaceCol ? colors!.value : Colors.white,
                    )
                  : const SizedBox(),
            ),
          ),
          tc.texts.bodyText(text),
        ],
      ),
    );
  }
}
