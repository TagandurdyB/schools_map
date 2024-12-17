import 'package:schools_map/config/core/exports.dart';
import 'package:schools_map/presentation/feautures/pages/regions_page.dart';
import '../../presentation/feautures/pages/detail_page.dart';
import '../../presentation/feautures/pages/home_page.dart';
import '../../presentation/public/pages/logo_page.dart';
import '../../presentation/public/pages/page_404.dart';

class AppRoute {
  static final GlobalKey<NavigatorState> mainNavKey = GlobalKey();
  static final context = mainNavKey.currentContext!;
  //====================================
  static MaterialPageRoute _pageRout(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
  //====================================

  static Route onGenerateRoute(RouteSettings routeSettings) {
    final args = routeSettings.arguments as Map?;
    switch (routeSettings.name) {
      case Go.logo:
        return _pageRout(const LogoPage());

      case Go.region:
        return _pageRout(const RegionsPage());
      case Go.home:
        return _pageRout(HomePage(region: args!['region']));
      case Go.detail:
        return _pageRout(DetailPage(school: args!['school']));
      default:
        return _pageRout(const Page404());
    }
  }
}
