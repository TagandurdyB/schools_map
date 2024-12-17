
import 'package:schools_map/config/core/exports.dart';


class TitleBar extends StatelessWidget {
  final String title;
  final Widget? label;
  final Widget action;
  final bool isMob;
  final bool centerTitle;
  final Function()? onBack;
  final Key? backKey;
  const TitleBar({
    this.title = '',
    this.action = const SizedBox(),
    this.label,
    this.isMob = false,
    this.centerTitle = true,
    this.onBack,
    this.backKey,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: onBack != null,
                child: BackBtn(
                  key: backKey,
                  onBack: onBack,
                  // color: cc.cols.sharpSwatch[950],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Visibility(
                  visible: !centerTitle,
                  child: Align(
                    alignment: isMob ? Alignment.center : Alignment.centerLeft,
                    child: buildTitle(context),
                  ),
                ),
              ),
              action,
            ],
          ),
          Visibility(visible: centerTitle, child: buildTitle(context)),
        ],
      ),
    );
  }

  Widget buildTitle(BuildContext context) {
    return label ??
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: cc.texts.bodyText(
            title,
            col: cc.cols.grey500,
            maxLines: 2,
            size: 24,
          ),
        );
  }
}
