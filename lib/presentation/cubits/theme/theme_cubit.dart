import 'package:schools_map/config/theme/colors.dart';
import 'package:schools_map/config/theme/shadows.dart';
import 'package:schools_map/config/theme/styles.dart';

import '../../../config/core/exports.dart';

part 'theme_state.dart';

// late AppLocalizations _dictionary;
// AddressEntity? _address;

bool _isLight = true;

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit()
      : super(ThemeState(
          
        ));

  static bool get isLight => _isLight;

  ThemeMode get mode => state.isSystem
      ? ThemeMode.system
      : state.isLight
          ? ThemeMode.light
          : ThemeMode.dark;
//INIT=========================
  void init() {
    // _initLight();
    // _initSystem();
    // _initAddress();
  }

  //Dictionary============================================================

  //System============================================================
  void _initSystem() {
    bool? read = Boxes.themeSystem;
    emit(state.copyWith(isSystem: read));
  }

  void changeSystem(bool val) {
    emit(state.copyWith(isSystem: val));
    Boxes.putThemeSystem(val);
  }

  void get tongleSystem {
    try {
      changeSystem(!state.isSystem);
    } catch (err) {
      throw ("Error on data Theme Provider tongleSystem:$err");
    }
  }

  //Light=============================================================
  void _initLight() {
    bool? read = Boxes.themeLight;
    emit(state.copyWith(isLight: read));
  }

  void changeLight(bool val) {
    emit(state.copyWith(isLight: val));
    Boxes.putThemeLight(val);
  }

  void get tongleLight {
    try {
      changeLight(!state.isLight);
    } catch (err) {
      throw ("Error on data Theme Provider tongleMode:$err");
    }
  }

//Address================================
  // void _initAddress() => changeAddress(Boxes.address);

  // void changeAddress(AddressEntity? val) {
  //   if (val != null) {
  //     _address = val;
  //     emit(state.copyWith(address: _address));
  //     Boxes.putAddress(_address!);
  //   }
  // }

//Address!===============================

//==========
  static ThemeCubit of(context, {listen = true}) =>
      BlocProvider.of<ThemeCubit>(context, listen: listen);

  // static AppLocalizations get getWords => _dictionary;
  // static AppLocalizations words(BuildContext? context, {bool listen = true}) =>
  //     ThemeCubit.of(context ?? AppRoute.context, listen: listen)
  //         .state
  //         .dictionary;

  static ColorsSheme getColors(bool isLight) =>
      isLight ? ColorsSheme() : ColorsDark();
}

//Component container
late TC cc;

class TC {
  final BuildContext context;
  late ColorsSheme cols;
  late ShadowsSheme shadow;
  late Texts texts;
  late Map<int, Map> dic;
  // late AppLocalizations dic;
  final bool listen;
  bool isLight = true;
  TC(
    this.context, {
    this.listen = true,
  }) {
    final state = ThemeCubit.of(context, listen: listen).state;
    isLight = Theme.of(context).brightness == Brightness.light;
    dic = state.dictionary;
    // dic = AppLocalizations.of(context) ?? AppLocalizationsEn();
    // _dictionary = dic;
    cols = ThemeCubit.getColors(isLight);
    shadow = ShadowsSheme(cols);
    texts = Texts(StylesSheme(cols));
  }
}
