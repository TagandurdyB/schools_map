import 'package:schools_map/config/core/exports.dart';
// import 'package:schools_map/data/models/card/card_model.dart';

// import '../../../data/models/category/category_model.dart';
// import '../../../data/models/lang/lang_model.dart';

class Boxes {
  static Future init({int? version, String? initPath}) async {
    await Hive.initFlutter(initPath);
    try {
      registerAdapters();
    } catch (e) {
      debugPrint("++++registerAdapters error:=$e");
    }
    await openBoxes().then((_) async {});
  }

  static void registerAdapters() {
    Hive.registerAdapter(LangAdapter());
    Hive.registerAdapter(FileSourceAdapter());
    Hive.registerAdapter(FTypeAdapter());
    //===================
    Hive.registerAdapter(FileObjectAdapter());
    // Hive.registerAdapter(CardModelAdapter());
    // Hive.registerAdapter(CategoryModelAdapter());
    // Hive.registerAdapter(LangModelAdapter());

    // Hive.registerAdapter(FTypeAdapter());
  }

  static Future<Box<T>> openBox<T>(String name) async {
    final result = await Hive.openBox<T>(name).catchError((error, s) async {
      debugPrint("+++Something goes wrong on Hive: $name : $error ,   $s");
      // await Hive.deleteBoxFromDisk(name);
      return Hive.openBox<T>(name);
    });
    return result;
  }

  static Future<List<void>> openBoxes() async {
    return Future.wait([
      openBox<dynamic>(HiveT.base),
      // openBox<CardModel>(HiveT.cards),
      // openBox<CategoryModel>(HiveT.categories),
      // openBox<LangModel>(HiveT.languages),
    ]);
  }

  // static Box schools = Hive.box<SchoolModel>(HiveT.schoolModel);
  //Values
  static Box base = Hive.box(HiveT.base);
  // static Box<CardModel> cards = Hive.box(HiveT.cards);
  // static Box<CategoryModel> categories = Hive.box(HiveT.categories);
  // static Box<LangModel> languages = Hive.box(HiveT.languages);

  // static LangModel get lang =>
  //     languages.get(HiveT.lang) ??
  //     LangModel(id: 1, name: 'türkmençe', code: 'TM');
  // static Future<void> putLang(LangModel val) => languages.put(HiveT.lang, val);

  static bool? get themeSystem => base.get(HiveT.themeSystem);
  static Future<void> putThemeSystem(bool val) =>
      base.put(HiveT.themeSystem, val);
  static bool? get themeLight => base.get(HiveT.themeLight);
  static Future<void> putThemeLight(bool val) =>
      base.put(HiveT.themeLight, val);

  // static Future<void> putAddress(AddressModel val) =>
  //     addresses.put(HiveT.address, val);

  // static UserRole get role =>
  //     UserRole.values.byName(base.get(HiveT.role) ?? 'unknown');
  // static Future<void> putRole(UserRole val) => base.put(HiveT.role, val.name);
}
