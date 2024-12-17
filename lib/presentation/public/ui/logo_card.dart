import 'package:schools_map/config/core/exports.dart';

class LogoCard extends StatelessWidget {
  final double? w;
  const LogoCard({
    this.w=250,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final tc = TC(context);
    return Container(
      width: w,
      height: 80,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: tc.cols.grey70,
            // offset: const Offset(0, 1),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
        color: tc.cols.navigationBg,
        image: const DecorationImage(
          image: ExactAssetImage(Asset.logoLight),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
