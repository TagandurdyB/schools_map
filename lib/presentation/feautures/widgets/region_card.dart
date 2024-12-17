// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:schools_map/config/core/exports.dart';

class RegionCard extends StatelessWidget {
  final RegionEntity region;
  const RegionCard({
    Key? key,
    required this.region,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InCard(
      col: cc.cols.grey50,
      child: cc.texts.bodyTextBold(region.name),
    );
  }
}
