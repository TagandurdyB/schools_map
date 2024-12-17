// ignore_for_file: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
import 'config/core/exports.dart';

class Injector extends StatelessWidget {
  final Widget child;
  const Injector(this.child, {super.key});

  static void cleanCubits(BuildContext context) {
    debugPrint('+++Injector.cleanCubits');
    context.read<NavCubit>().ereaseScreen();
  }

  Map<String, dynamic> createRepos() => {
        'region': RegionRepo(RegionSource()),
        'school': SchoolRepo(SchoolSource()),
        // 'sound_service': SoundService(),
      };

  @override
  Widget build(BuildContext context) {
    final repos = createRepos();
    final repoProviders = getRepositories(repos);
    final providers = getProviders(repos);
    return MultiRepositoryProvider(
        providers: repoProviders,
        child: MultiBlocProvider(
            providers: providers,
            child: Builder(builder: (context) {
              return child;
            })));
  }

  List<RepositoryProvider> getRepositories(Map<String, dynamic> repos) => [
        createRepoProvider<RegionRepo>(repos['region']),
        createRepoProvider<SchoolRepo>(repos['school']),
        // createRepoProvider<SoundService>(repos['sound_service']),
      ];

  RepositoryProvider<T> createRepoProvider<T>(T repo) {
    return RepositoryProvider<T>(create: (context) => repo);
  }

  List<BlocProvider> getProviders(Map<String, dynamic> repos) => [
        //====================================================
        BlocProvider<RegionCubit>(
            create: (context) => RegionCubit(repos['region'])),
        BlocProvider<SchoolCubit>(
            create: (context) => SchoolCubit(repos['school'])),
        // BlocProvider<SelectedCardCubit>(
        //     create: (context) => SelectedCardCubit()),
        //====================================================
        BlocProvider<NavCubit>(create: (context) => NavCubit()),
        BlocProvider<ResponsiveCubit>(
            create: (context) => ResponsiveCubit()..init()),
        BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()..init()),
      ];
}
