import 'package:schools_map/config/core/exports.dart';

part 'hive_enums.g.dart';

@HiveType(typeId: 0)
enum Lang {
  @HiveField(2)
  en("English", 'US', Locale('en')),
  @HiveField(1)
  ru("Pyсский язык", 'RU', Locale('ru')),
  @HiveField(0)
  tm("Türkmen dili", 'TM', Locale('tk'));

  const Lang(this.value, this.code, this.locale);
  final String value;
  final String code;
  final Locale locale;
}

@HiveType(typeId: 1)
enum FileSource {
  @HiveField(0)
  asset,
  @HiveField(1)
  network,
  @HiveField(2)
  file,
  @HiveField(3)
  memory,
  @HiveField(4)
  err;

  bool get isAsset => super == asset;

  bool get isNetwork => super == network;

  bool get isFile => super == file;

  bool get isMemory => super == memory;

  bool get isErr => super == err;
}

