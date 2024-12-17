// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:schools_map/config/core/exports.dart';

class SchoolCard extends StatelessWidget {
  final SchoolEntity school;
  const SchoolCard({
    Key? key,
    required this.school,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InCard(
      col: cc.cols.grey40,
      child: cc.texts.bodyTextBold(
        school.name,
        maxLines: 100,
      ),
    );
  }
}
