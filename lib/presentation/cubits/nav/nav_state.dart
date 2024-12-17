part of 'nav_cubit.dart';

class NavState {
  int screenIndex;
  int othersIndex;
  Map<int, List<Widget>> screen;
  RegionEntity? region;
  NavRoute route;
  NavState({
    this.screenIndex = 0,
    this.othersIndex = 0,
    this.region,
    required this.screen,
    required this.route,
  });

  NavState copyWith({
    int? screenIndex,
    int? othersIndex,
    Map<int, List<Widget>>? screen,
    RegionEntity? region,
    NavRoute? route,
  }) {
    return NavState(
      screenIndex: screenIndex ?? this.screenIndex,
      othersIndex: othersIndex ?? this.othersIndex,
      screen: screen ?? this.screen,
      region: region ?? this.region,
      route: route ?? this.route,
    );
  }
}
