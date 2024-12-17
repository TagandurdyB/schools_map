import 'package:schools_map/config/core/exports.dart';

import '../../public/scaffold/title_bar.dart';
import '../widgets/school_card.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late RegionEntity? region = context.read<NavCubit>().state.region;
  @override
  Widget build(BuildContext context) {
    cc=TC(context);
    return Column(
      children: [
        const SizedBox(height: 8),
        TitleBar(
          title: 'Sanaw',
          onBack: () => Go.pop(),
        ),
        Expanded(
          child: context.watch<SchoolCubit>().state.when(
              loading: () => const LoadingWidget(),
              err: (res) => const SizedBox(),
              ready: (datas) {
                if (datas.isEmpty || region == null) {
                  return const Center(child: EmptyWidget());
                }
                final schools = datas[region!];
                return RefreshView(
                  itemCount: schools!.length,
                  itemBuilder: (index) {
                    final school = schools[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: GestureDetector(
                        onTap: () =>
                            Go.to(Go.detail, argument: {'school': school}),
                        child: SchoolCard(school: school),
                      ),
                    );
                  },
                );
              }),
        ),
      ],
    );
  }
}
