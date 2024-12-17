import 'package:schools_map/config/core/exports.dart';

class BtnData {
  dynamic iconD;
  String title;
  void Function()? onTap;
  late Widget icon;
  final Color? iconCol;
  final bool? loading;
  final MapEntry<Color, Color>? colors;
  final value;
  BtnData({
    this.iconD,
    required this.title,
    this.onTap,
    this.iconCol,
    this.colors,
    this.loading,
    this.value,
  }) {
    icon = Icon(
      Icons.question_mark_rounded,
      color: iconCol,
    );
    if (iconD is IconData) {
      icon = Icon(
        iconD,
        color: iconCol,
      );
    } else if (iconD is String) {
      icon = SvgPicture.asset(
        iconD,
        color: iconCol,
      );
    }
  }
}
