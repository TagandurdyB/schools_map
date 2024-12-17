import 'package:schools_map/config/core/exports.dart';
import 'package:schools_map/presentation/public/scaffold/navigation/routes/nav_route.dart';
part 'nav_state.dart';

class NavCubit extends Cubit<NavState> {
  NavCubit() : super(NavState(screen: {}, route: GuestRoute()));

  void changeScreenIndex(int index) {
    emit(state.copyWith(screenIndex: index));
  }

  void changeRegion(RegionEntity region) {
    emit(state.copyWith(region: region));
  }

  void addScreen(Widget child, int index) {
    var screen = state.screen;
    if (screen[index] == null) {
      screen[index] = [child];
    } else {
      screen[index]!.add(child);
    }
    debugPrint('+++++++++++${screen[index]}');
    // changeScreenIndex(index);
    emit(state.copyWith(screen: screen));
  }

  bool willPop() {
    final list = state.screen[state.screenIndex];
    if (list == null) {
      return false;
    } else if (list.length > 1) {
      popScreen(state.screenIndex);
      return true;
    } else if (state.screenIndex != 0) {
      changeScreenIndex(0);
      return true;
    }
    return false;
  }

  void popScreen(int index) {
    var screen = state.screen;
    if (screen[index] != null) {
      if (screen[index]!.length == 1) {
        ereaseScreen(index: index);
      } else {
        screen[index]!.removeLast();
      }
      emit(state.copyWith(screen: screen));
    }
    // changeScreenIndex(index);
  }

  void ereaseScreen({int? index}) {
    if (index == null) {
      emit(state.copyWith(screen: {}));
    } else {
      var screen = state.screen;
      screen.remove(index);
      emit(state.copyWith(screen: screen));
    }
  }

  // void serRoute() {
  //   NavRoute route = GuestRoute();
  //   if (Boxes.role.isClient) {
  //     route = ClientRoute();
  //   } else if (Boxes.role.isSeller) {
  //     route = SellerRoute();
  //   }
  //   emit(state.copyWith(route: route));
  // }
}
