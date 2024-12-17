import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:schools_map/config/core/exports.dart';
import 'package:schools_map/config/theme/colors.dart';
import 'package:schools_map/config/theme/styles.dart';

class MyTheme {
  static final isAndroid = defaultTargetPlatform == TargetPlatform.android;

  static ThemeData light = theme(
    ColorsSheme(),
    Brightness.light,
  );
  static ThemeData dark = theme(ColorsDark(), Brightness.dark);

  static fillInputTheme(ColorsSheme colors) {
    return ThemeData(
      inputDecorationTheme: MyTheme.inputTheme(
        8,
        colors,
        fillColor: colors.alabaster,
      ),
    );
  }

  static InputDecorationTheme inputTheme(
    double rad,
    ColorsSheme colors, {
    Color? fillColor,
    EdgeInsets? contentPadding,
  }) {
    return InputDecorationTheme(
      contentPadding: contentPadding,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(rad)),
          borderSide: BorderSide(color: colors.orange200)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(rad)),
          borderSide: BorderSide(color: colors.card)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(rad)),
          borderSide: const BorderSide(color: Colors.red)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(rad)),
          borderSide: const BorderSide(color: Colors.red)),
      fillColor: fillColor ?? colors.canvas,
      filled: true,
      // labelStyle: styles.placeholder,
      // prefixStyle: styles.placeholder.copyWith(color: const Color(0xff2E2F37)),
    );
  }

  static ThemeData theme(
    ColorsSheme colors,
    Brightness brightness,
  ) {
    StylesSheme styles = StylesSheme(colors);

    Brightness statusBarBR = Brightness.light;
    if (isAndroid && statusBarBR == brightness) statusBarBR = Brightness.dark;
    return ThemeData(
      useMaterial3: false,
      fontFamily: 'SF_PRO_Display', //Hemme yerde gerek dal shunda bersek.
      // primarySwatch: colors.primarySwatch,
      // primaryColor:colors.orange400,
      // indicatorColor: colors.orange300,
      // colorScheme: ColorScheme.fromSwatch().copyWith(
      //   secondary: colors.orange300,
      // ),
      primaryColor: colors.orange100,
      progressIndicatorTheme:
          ProgressIndicatorThemeData(color: colors.orange300),
      brightness: brightness,
      iconTheme: IconThemeData(color: colors.grey400),
      inputDecorationTheme: inputTheme(100, colors),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          // primary:  // Button background color
          // textStyle: Colors.white, // Button text color
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: inputTheme(
          8,
          colors,
          fillColor: colors.alabaster,
          contentPadding: const EdgeInsets.all(0),
        ),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colors.orange300, // Color of the blinking cursor
        selectionColor: colors.orange300
            .withOpacity(0.3), // Color of selected text background
        selectionHandleColor: colors.orange300,
      ),
      switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? colors.switchActiv
                : colors.switchUnActiv,
          ),
          trackColor: MaterialStateProperty.resolveWith(
            (states) => states.contains(MaterialState.selected)
                ? colors.switchActivBg
                : colors.switchBg,
          )
          //MaterialStateProperty.all(colors.switchBg),
          //  materialTapTargetSize: MaterialTapTargetSize.values,
          ),
      textTheme: TextTheme(
        bodyMedium: TextStyle(color: colors.text),
      ).apply(
        bodyColor: colors.text,
        // displayColor: Colors.blue,
      ),
      listTileTheme: ListTileThemeData(
        iconColor: colors.appBarIcon,
        textColor: colors.text,
      ),
      dataTableTheme: DataTableThemeData(
        dataRowColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.selected)) {
            return colors.grey90;
          }
          return null; // Use the default value.
        }),
      ),

      popupMenuTheme: PopupMenuThemeData(
        color: colors.canvas,
      ),
      indicatorColor: colors.orange300,
      buttonTheme: ButtonThemeData(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100))),
      // floatingActionButtonTheme:
      //     FloatingActionButtonThemeData(backgroundColor: colors.floatingAction),
      canvasColor: colors.canvas,
      scaffoldBackgroundColor: colors.canvas,
      // primaryColor: colors.primarySwatch,
      appBarTheme: AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: colors.canvas, //Colors.transparent,
          statusBarIconBrightness: statusBarBR,
          systemNavigationBarColor: Colors.transparent,
          //colors.systemNavigationBarColor,
          systemNavigationBarIconBrightness: statusBarBR,
        ),
        color: colors.canvas,
        // shadowColor: colors.appBarShadow,
        // titleTextStyle: styles.appBar,
        iconTheme: IconThemeData(
          color: colors.grey500,
        ),
      ),
      navigationBarTheme: const NavigationBarThemeData(),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        backgroundColor: colors.navigationBg,
        selectedIconTheme: const IconThemeData(
          // color: colors.navigatActiveIcon,
          size: 30,
        ),
        unselectedIconTheme: const IconThemeData(
          // color: colors.navigatUnactiveIcon,
          size: 28,
        ),
        selectedItemColor: colors.navigatActiveIcon,
        unselectedItemColor: colors.navigatUnactiveIcon,
        selectedLabelStyle: styles.bodyTextBold.copyWith(
          fontSize: 14,
        ),
        unselectedLabelStyle: styles.bodyText.copyWith(
          fontSize: 14,
        ),
        // showSelectedLabels: false,
        // showUnselectedLabels: false,
      ),
    );
  }
}
