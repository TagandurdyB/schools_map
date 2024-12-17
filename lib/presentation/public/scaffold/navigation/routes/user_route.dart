import 'package:flutter/cupertino.dart';
import 'package:schools_map/config/core/exports.dart';
import 'nav_route.dart';

class GuestRoute implements NavRoute {
  static Icon ic(IconData icon) => Icon(icon, size: 26);

  @override
  Map<String, Widget> bottom() {
    return {
      "Home": ic(Icons.home),
      'Categories': ic(Icons.menu_open_sharp),
      'dic.cart': ic(Icons.shopping_cart_outlined),
      // dic.wishlist: ic(Icons.favorite_outline_sharp),
    };
  }

  @override
  int get mobLength => 5;

  @override
  int? changeScreen(BuildContext context, int index, {dynamic argument}) {
    Widget? child;
    final navCub = context.read<NavCubit>();
    if (navCub.state.screen[index] == null) {
      switch (index) {
        case 0:
          {
            // child = const HomeScreen();
          }
        case 1:
          {
            // child = const CategoryScreen();
          }
        case 2:
          {
            return changeScreen(context, 4, argument: argument);
            // child = const CartScreen();
          }
        case 3:
          {
            // child = const WishScreen();
            // child = const DiscoverScreen();
            // VideoPage()
            ToastService.message('Coming soon', false);

            // Go.to(Go.discover);
            return null;
          }
        case 4:
          {
            // child = LoginScreen();
            // Go.to(Go.login);
            // return null;
          }

        // case 5:
        //   {
        //     index = 3;
        //     child = PeriodGradeScreen(
        //       onBack: () => navCub.popScreen(index),
        //     );
        //   }

        default:
          () => null;
      }
    }
    if (child != null) {
      navCub.addScreen(child, index);
    }
    return index;
  }
}
