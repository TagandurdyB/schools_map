import 'package:schools_map/config/core/exports.dart';

import '../widgets/region_card.dart';

class RegionsPage extends StatefulWidget {
  const RegionsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegionsPage> createState() => _RegionsPageState();
}

class _RegionsPageState extends State<RegionsPage> {
  bool canExit = false;

  @override
  void initState() {
    // MyOrientation.enableSystemUI();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<RegionCubit>().fill().then((regions) {
        if (regions?.isNotEmpty ?? false) {
          // final nav = context.read<NavCubit>();
          // nav.addScreen(RegionsPage(regions: regions!), 1);
        }
      });
    });
    super.initState();
  }

  Future<bool> onWillPop() async {
    final navCub = context.read<NavCubit>();
    if (navCub.willPop()) {
      return false;
    } else if (canExit) {
      return true;
    } else {
      ToastService.message(
        'Çykmak üçin ýene basyň.',
        false,
        col: Colors.blue,
      );
      canExit = true;
      Future.delayed(const Duration(seconds: 2)).then(
        (_) => canExit = false,
      );
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        appBar: AppBar(
          title: cc.texts.bodyTextBold('Şäherler', size: 20),
          centerTitle: true,
        ),
        body: context.watch<RegionCubit>().state.when(
            loading: () => const LoadingWidget(),
            err: (res) => const SizedBox(),
            ready: (regions) {
              if (regions.isEmpty) {
                return const Center(child: EmptyWidget());
              }
              return RefreshView(
                itemCount: regions.length,
                itemBuilder: (index) {
                  final region = regions[index];
                  return GestureDetector(
                    onTap: () => Go.to(Go.home, argument: {"region": region}),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: RegionCard(region: region),
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}
