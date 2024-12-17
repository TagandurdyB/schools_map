import 'package:schools_map/config/core/exports.dart';

class HomeIndicator extends StatelessWidget {
  const HomeIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: InCard(
        pad: const EdgeInsets.all(0),
        h: 5,
        col: cc.cols.grey40,
        child: const SizedBox(width: 60),
      ),
    );
  }
}
