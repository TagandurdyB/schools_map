

import '../../../config/core/exports.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, toolbarHeight: 0),
      body: Column(children: [
        TopBar(),
      ]),
    );
  }
}