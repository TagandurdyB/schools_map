import 'package:schools_map/config/core/exports.dart';

abstract class NavRoute {
  // Map<String, Widget> core(Dictionary dic);
  // Map<String, Widget> mobile(BuildContext context);
  Map<String, Widget> bottom();
  int get mobLength;
  // Map<String, Widget> menu(Dictionary dic);
  // Map<String, Widget> tablet(BuildContext context);
  int? changeScreen(BuildContext context, int index, {dynamic argument});
  // void changeScreenWeb(BuildContext context, int index, {dynamic argument});
}
