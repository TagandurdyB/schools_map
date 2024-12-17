// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:schools_map/config/core/exports.dart';
import 'package:schools_map/presentation/feautures/pages/list_screen.dart';

import '../../public/ui/loaded_drawer_btn.dart';
import 'map_screen.dart';

class HomePage extends StatefulWidget {
  final RegionEntity region;
  const HomePage({
    Key? key,
    required this.region,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // MyOrientation.enableSystemUI();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SchoolCubit>().fill(widget.region).then((schools) {
        if (schools?.isNotEmpty ?? false) {
          try {
            final nav = context.read<NavCubit>();
            nav.changeRegion(widget.region);
            nav.ereaseScreen();
            if (nav.state.screen.isEmpty) {
              nav.addScreen(const ListScreen(), 0);
              nav.addScreen(const MapScreen(), 1);
            }
          } catch (_) {}
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1470,
      child: Align(
        alignment: Alignment.center,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Scaffold(
                  // appBar: AppBar(),
                  backgroundColor: cc.cols.grey40,
                  body: buildContent(context),
                ),
                // Positioned(
                //   // top: kToolbarHeight * 0.5,
                //   child: LoadedDrawerBtn(onLongTap: () {
                //     MyOrientation.setPortraitUp();
                //     Go.to(Go.settings)
                //         .then((_) => MyOrientation.enableSystemUI());
                //   }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Center buildContent(BuildContext context) {
    return Center(
      child: context.watch<SchoolCubit>().state.when(
          loading: () => const LoadingWidget(),
          err: (res) => cc.texts.heading3('$res', maxLines: 100),
          ready: (schools) {
            return BlocBuilder<NavCubit, NavState>(
              builder: (context, state) {
                return ResponsiveWidget(
                  builder: (orientation, constraints, device) {
                    return Column(
                      children: [
                        Expanded(
                          child: buildScreen(state),
                        ),
                        buildNavigation(state),
                      ],
                    );
                  },
                );
              },
            );
          }),
    );
  }

  Column buildScreen(NavState state) {
    return Column(
      children: [
        // BlocBuilder<SelectedCardCubit, SelectedCardState>(
        //   builder: (context, state) {
        //     return MainCards(cards: state.cards);
        //   },
        // ),
        Expanded(
          child: Stack(
              children: state.screen.entries
                  .map((e) => Offstage(
                        offstage: state.screenIndex != e.key,
                        child: Stack(
                          children:
                              e.value.map((e) => Scaffold(body: e)).toList(),
                        ),
                      ))
                  .toList()),
        ),
      ],
    );
  }

  final screens = [const ListScreen(), const MapScreen()];

  Widget buildNavigation(
    NavState state, {
    bool isTablet = false,
  }) {
    return BottomNavigation(
      currentIndex: state.screenIndex,
      isTablet: isTablet,
      onChange: (index) {
        final nav = context.read<NavCubit>();
        // if (nav.state.screen[index] == null) {
        //   nav.addScreen(screens[index], index);
        // }
        print("+++++index:=$index");
        nav.changeScreenIndex(index);
      },
    );
  }
}
