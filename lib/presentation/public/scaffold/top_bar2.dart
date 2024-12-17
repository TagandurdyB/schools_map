// ignore_for_file: must_be_immutable

import 'package:schools_map/presentation/public/ready_Input/input_widget.dart';
import 'package:schools_map/presentation/public/ready_Input/ready_input_base.dart';

import '../../../config/core/exports.dart';
import 'navigation/bottom_navigation.dart';

class TopBar extends StatelessWidget {
  final bool isAbout, isSearch;
  final void Function()? onSearch;
  final void Function()? onBack;
  TopBar({
    this.isAbout = true,
    this.isSearch = true,
    this.onSearch,
    this.onBack,
    super.key,
  });

  late TC tc;
  late BuildContext context;
  @override
  Widget build(BuildContext context) {
    tc = TC(context);
    this.context = context;
    return Container(
      color: tc.cols.navigationBg,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: buildTop(),
          ),
          Divider(color: tc.cols.grey300),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: buildBottom(),
          ),
        ],
      ),
    );
  }

  Widget buildTop() {
    return Row(
      children: [
        Visibility(
          visible: onBack!=null,
          child: GestureDetector(
            onTap: (){
              onBack!();
            },
            child: const InCard(
              pad: EdgeInsets.all(8),
              child: Icon(Icons.arrow_back)),
          ),
        ),
          const SizedBox(width: 4),
        Expanded(
          child: !isAbout || isSearch ? buildSearch() : buildInput(),
        ),
        const SizedBox(width: 4),
        buildChat(),
        const SizedBox(width: 4),
        buildMenu(),
      ],
    );
  }

  GestureDetector buildSearch() {
    return GestureDetector(
      onTap: () {
        if (onSearch != null) {
          onSearch!();
        } else {
          // if (isSearch) Go.to(Go.search);
        }
      },
      child: InCard(
          pad: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(Icons.search_sharp, color: tc.cols.grey100),
              const SizedBox(width: 4),
              tc.texts.bodyText(
                "Search schools_map",
                col: tc.cols.grey100,
              ),
            ],
          )),
    );
  }

  Widget buildInput() {
    return InputWidget(
      tag: 'search',
      autoFocus: true,
      hidden: 'Search schools_map',
      onEditingComplete: () {
        // Go.toReplace(
        //   Go.searchResult,
        //   argument: {'search': RIBase.getText('search')},
        // );
      },
    );
  }

  Widget buildChat() {
    return GestureDetector(
        onTap: () {
          // if (isAbout) Go.to(Go.about);
        },
        child: const Icon(Icons.chat_bubble_outline));
  }

  Widget buildMenu() {
    return GestureDetector(
        onTap: () {
          if (!isAbout || !isSearch) Go.pop();
          final navCub = context.read<NavCubit>();
          navCub.state.route.changeScreen(context, 1);
          navCub.changeScreenIndex(1);
        },
        child: const Icon(Icons.menu));
  }

  Widget buildBottom() {
    return Row(
      children: [
        const Icon(Icons.location_on_outlined),
        tc.texts.bodyText("Address • "),
        Expanded(
          child: tc.texts.bodyTextBold(
            "Enter your delivery address",
            col: tc.cols.orange300,
          ),
        ),
        const Icon(Icons.arrow_forward_ios_sharp),
      ],
    );
  }
}
