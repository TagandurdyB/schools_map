import 'package:flutter/material.dart';

import 'app_route.dart';

class Go {
  static const logo = '/';
  static const disconnect = '/DisconnectPage';

  static const region = '/region';
  static const home = '/home';
  static const detail = '/detail';

  static const settings = '/SettingsPage';
  static const language = '/LanguagePage';
  static const addCard = '/AddCardPage';
  static const createCard = '/CreateCardPage';
  static const addCategory = '/AddCategoryPage';
  static const createCategory = '/CreateCategoryPage';
  static const aboutUs = '/AboutUsPage';



  //================================================================================================
  static String? get currentRoute =>
      AppRoute.mainNavKey.currentState?.widget.pages.last.name;
  //================================================================================================
  static Future to(String routName, {Map? argument}) {
    // current = name;
    // HapticFeedback.mediumImpact();
    return AppRoute.mainNavKey.currentState!
        .pushNamed(routName, arguments: argument);
    // .then((value) => true);
  }

  static Future toReplace(String routName, {Map? argument}) {
    return AppRoute.mainNavKey.currentState!
        .pushReplacementNamed(routName, arguments: argument)
        .then((value) => true);
  }

  static Future toRemoveUntil(
      String routName, bool Function(Route<dynamic> route) predicate,
      {Map? argument}) {
    return AppRoute.mainNavKey.currentState!
        .pushNamedAndRemoveUntil(routName, predicate, arguments: argument)
        .then((value) => true);
  }

  static void pop({List? args}) {
    return AppRoute.mainNavKey.currentState!.pop(args);
  }

  static void popUntil(bool Function(Route<dynamic> route) predicate) {
    return AppRoute.mainNavKey.currentState!.popUntil(predicate);
  }

  static Future popAndPush(String routName, {Map? argument}) {
    return AppRoute.mainNavKey.currentState!
        .popAndPushNamed(routName, arguments: argument)
        .then((value) => true);
  }

  static String? get routeName {
    String? route = "";
    AppRoute.mainNavKey.currentState?.popUntil((currentRoute) {
      route = currentRoute.settings.name;
      return true;
    });
    return route;
  }
}
