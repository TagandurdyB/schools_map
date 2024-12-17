// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:schools_map/config/core/exports.dart';

class DetailPage extends StatelessWidget {
  final SchoolEntity school;
  const DetailPage({
    Key? key,
    required this.school,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: cc.texts.bodyTextBold(school.name, size: 20),
        centerTitle: true,
      ),
      body: RefreshView(
        children: [
          buildRow('Mekdep belgisi', school.name),
          buildRow('Doly salgysy', school.address),
          buildRow('Telefon belgiler', school.phone),
          buildRow('Mekdebiň gurlan ỳyly', school.buildYear),
        ],
      ),
    );
  }

  Widget buildRow(String title, String? data) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 4,
          child: cc.texts.bodyTextBold(title, maxLines: 100),
        ),
        const SizedBox(width: 16),
        Expanded(
          flex: 6,
          child: cc.texts.bodyText(data ?? '-', maxLines: 100),
        ),
      ]),
    );
  }
}
