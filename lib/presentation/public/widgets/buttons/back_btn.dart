import 'package:schools_map/config/core/exports.dart';

class BackBtn extends StatelessWidget {
  final void Function()? onBack;
  const BackBtn({this.onBack, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack ?? () => Go.pop(),
      child: const Icon(Icons.arrow_back_ios_new_rounded),
    );
  }
}
