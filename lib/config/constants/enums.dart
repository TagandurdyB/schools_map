import 'hive_enums.dart';

enum LengthUnit {
  cm('Centimeters'),
  m('Meters'),
  inc('Inches');

  const LengthUnit(this.tag);
  final String tag;
}

enum WeightUnit {
  kg('Kilograms'),
  g('Grams'),
  lb('Pounds'),
  oz('Ounces');

  const WeightUnit(this.tag);
  final String tag;
}

enum ContactPersonRole {
  owner('Is a business owner'),
  legalRepresentative('Is the legal owner of the business');

  const ContactPersonRole(this.tag);
  final String tag;
}

enum ViewType { wrap, column, row }

enum SortType {
  newArrivals({
    Lang.tm: 'New arrivals',
    Lang.ru: 'New arrivals',
    Lang.en: 'New arrivals',
  }, '-created'),
  lowestPrice({
    Lang.tm: 'Lowest price',
    Lang.ru: 'Lowest price',
    Lang.en: 'Lowest price',
  }, 'min_price'),
  highestPrice({
    Lang.tm: 'Highest price',
    Lang.ru: 'Highest price',
    Lang.en: 'Highest price',
  }, '-min_price'),
  bestsellers({
    Lang.tm: 'Bestsellers',
    Lang.ru: 'Bestsellers',
    Lang.en: 'Bestsellers',
  }, 'quantity_sold'),
  mostRated({
    Lang.tm: 'Most rated',
    Lang.ru: 'Most rated',
    Lang.en: 'Most rated',
  }, 'avg_rating');

  const SortType(this.tag, this.query);
  final Map<Lang, String> tag;
  final String query;
}

enum ErrType {
  unknown({
    Lang.tm: 'Näbelli näsazlyk!',
    Lang.ru: 'Неизвестная ошибка!',
    Lang.en: 'Unknown error!',
  }),
  disconnect({
    Lang.tm: 'Internet ýok!',
    Lang.ru: 'Без интернет!',
    Lang.en: 'No Internet!',
  }),
  exeption({
    Lang.tm: 'Kadadan çykyldy!',
    Lang.ru: 'Вышел из строя!',
    Lang.en: 'Out of order!',
  }),

  invalid({
    Lang.tm: 'Nädogry!',
    Lang.ru: 'Неверный!',
    Lang.en: 'Invalid!',
  }),
  required({
    Lang.tm: 'Maglumat ýetenok!',
    Lang.ru: 'Необходимый!',
    Lang.en: 'Fill requred fields!',
  }),
  notSet({
    Lang.tm: 'Kesgitlenmedi!',
    Lang.ru: 'Не задано!',
    Lang.en: 'Some variables not set!',
  }),
  notExists({
    Lang.tm: 'Tapylmady!',
    Lang.ru: 'Не существует!',
    Lang.en: 'Not exists!',
  }),
  expired({
    Lang.tm: 'Möhleti gutardy!',
    Lang.ru: 'Истекший!',
    Lang.en: 'Expired!',
  }),
  unauthorized({
    Lang.tm: 'Täzeden giriň!',
    Lang.ru: 'Несанкционированный!',
    Lang.en: 'Unauthorized!',
  }),
  forbidden({
    Lang.tm: 'Rugsat ýok!',
    Lang.ru: 'Запрещенный!',
    Lang.en: 'Forbidden!',
  }),
  server({
    Lang.tm: 'Serwerde näsazlyk ýüze çykdy!',
    Lang.ru: 'Ошибка нa серверe!',
    Lang.en: 'Server error!',
  }),
  notPaid({
    Lang.tm: 'Töleg edilmedik!',
    Lang.ru: 'Нам не заплатили!',
    Lang.en: 'Not paid!',
  });

  bool get isUnknown => super == unknown;
  bool get isDisconnect => super == disconnect;
  bool get isExeption => super == exeption;

  bool get isInvalid => super == invalid;
  bool get isRequired => super == required;
  bool get isNotSet => super == notSet;
  bool get isNotExists => super == notExists;
  bool get isExpired => super == expired;
  bool get isUnauthorized => super == unauthorized;
  bool get isForbidden => super == forbidden;
  bool get isServer => super == server;
  bool get isNotPaid => super == notPaid;

  bool get isApi => !(isUnknown || isDisconnect || isExeption);

  const ErrType(this.tag);
  final Map<Lang, String> tag;
}

enum OS {
  android('assets/images/android.png', 'Android'),
  ios('assets/images/ios.png', 'IOS'),
  windows('assets/images/windows.png', 'Windows'),
  macos('assets/images/macbook.png', 'MacOS'),
  linux('assets/images/linux.png', 'Linux'),
  web('assets/images/web.png', 'Web'),
  unknown('', 'unknown');

  bool get isAndroid => super == android;

  bool get isIos => super == ios;

  bool get isWindows => super == windows;

  bool get isMacbook => super == macos;

  bool get isLinux => super == linux;

  bool get isWeb => super == web;

  bool get isUnknown => super == unknown;

  const OS(this.img, this.tag);
  final String tag;
  final String img;
}

enum Device {
  mobile('assets/images/mobile.png', 'Mobile'),
  tablet('assets/images/tablet.png', 'Tablet'),
  desktop('assets/images/desktop.png', 'Desktop'),
  unknown('assets/images/unknown.png', 'unknown');

  bool get isMobile => super == mobile;

  bool get isTablet => super == tablet;

  bool get isDesktop => super == desktop;

  bool get isUnknown => super == unknown;

  const Device(this.img, this.tag);
  final String tag;
  final String img;
}

enum FileType {
  asset,
  network,
  file,
  memory,
  svg,
  err;

  bool get isAsset => super == asset;

  bool get isNetwork => super == network;

  bool get isFile => super == file;

  bool get isMemory => super == memory;

  bool get isSvg => super == svg;

  bool get isErr => super == err;
}

enum WeekDay {
  mo({
    Lang.tm: "Duşenbe",
    Lang.ru: "Понедельник",
    Lang.en: "Monday",
  }, 1),
  tu({
    Lang.tm: "Sişenbe",
    Lang.ru: "Вторник",
    Lang.en: "Tuesday",
  }, 2),
  we({
    Lang.tm: "Çarşenbe",
    Lang.ru: "Среда",
    Lang.en: "Wednesday",
  }, 3),
  th({
    Lang.tm: "Penşenbe",
    Lang.ru: "Четверг",
    Lang.en: "Thursday",
  }, 4),
  fr({
    Lang.tm: "Anna",
    Lang.ru: "Пятница",
    Lang.en: "Friday",
  }, 5),
  sa({
    Lang.tm: "Şenbe",
    Lang.ru: "Суббота",
    Lang.en: "Saturday",
  }, 6),
  su({
    Lang.tm: "Ýekşenbe",
    Lang.ru: "Воскресенье",
    Lang.en: "Sunday",
  }, 7);

  const WeekDay(this.tag, this.toInt);
  final Map<Lang, String> tag;
  final int toInt;
}

enum Months {
  ja({
    Lang.tm: "Ýanwar",
    Lang.ru: "Январь",
    Lang.en: "January",
  }, 1),
  fe({
    Lang.tm: "Fewral",
    Lang.ru: "Февраль",
    Lang.en: "February",
  }, 2),
  mar({
    Lang.tm: "Mart",
    Lang.ru: "Март",
    Lang.en: "March",
  }, 3),
  ap({
    Lang.tm: "Aprel",
    Lang.ru: "Апрель",
    Lang.en: "April",
  }, 4),
  may({
    Lang.tm: "Maý",
    Lang.ru: "Май",
    Lang.en: "May",
  }, 5),
  jun({
    Lang.tm: "Iýun",
    Lang.ru: "Июнь",
    Lang.en: "June",
  }, 6),
  jul({
    Lang.tm: "Iýul",
    Lang.ru: "Июль",
    Lang.en: "July",
  }, 7),
  au({
    Lang.tm: "Awgust",
    Lang.ru: "Август",
    Lang.en: "August",
  }, 8),
  se({
    Lang.tm: "Sentýabr",
    Lang.ru: "Сентябрь",
    Lang.en: "September",
  }, 9),
  oc({
    Lang.tm: "Oktýabr",
    Lang.ru: "Октябрь",
    Lang.en: "October",
  }, 10),
  no({
    Lang.tm: "Noýabr",
    Lang.ru: "Ноябрь",
    Lang.en: "November",
  }, 11),
  de({
    Lang.tm: "Dekabr",
    Lang.ru: "Декабрь",
    Lang.en: "December",
  }, 12);

  const Months(this.tag, this.toInt);
  final Map<Lang, String> tag;
  final int toInt;
}

// enum WeekDay {
//   mo({
//     Lang.tm: "Duşenbe",
//     Lang.ru: "Понедельник",
//     Lang.en: "Monday",
//   }, 1),
//   tu({
//     Lang.tm: "Sişenbe",
//     Lang.ru: "Вторник",
//     Lang.en: "Tuesday",
//   }, 2),
//   we({
//     Lang.tm: "Çarşenbe",
//     Lang.ru: "Среда",
//     Lang.en: "Wednesday",
//   }, 3),
//   th({
//     Lang.tm: "Penşenbe",
//     Lang.ru: "Четверг",
//     Lang.en: "Thursday",
//   }, 4),
//   fr({
//     Lang.tm: "Anna",
//     Lang.ru: "Пятница",
//     Lang.en: "Friday",
//   }, 5),
//   sa({
//     Lang.tm: "Şenbe",
//     Lang.ru: "Суббота",
//     Lang.en: "Saturday",
//   }, 6),
//   su({
//     Lang.tm: "Ýekşenbe",
//     Lang.ru: "Воскресенье",
//     Lang.en: "Sunday",
//   }, 7);

//   const WeekDay(this.tag, this.toInt);
//   final Map<Lang, String> tag;
//   final int toInt;
// }

// enum Months {
//   ja({
//     Lang.tm: "Ýanwar",
//     Lang.ru: "Январь",
//     Lang.en: "January",
//   }, 1),
//   fe({
//     Lang.tm: "Fewral",
//     Lang.ru: "Февраль",
//     Lang.en: "February",
//   }, 2),
//   mar({
//     Lang.tm: "Mart",
//     Lang.ru: "Март",
//     Lang.en: "March",
//   }, 3),
//   ap({
//     Lang.tm: "Aprel",
//     Lang.ru: "Апрель",
//     Lang.en: "April",
//   }, 4),
//   may({
//     Lang.tm: "Maý",
//     Lang.ru: "Май",
//     Lang.en: "May",
//   }, 5),
//   jun({
//     Lang.tm: "Iýun",
//     Lang.ru: "Июнь",
//     Lang.en: "June",
//   }, 6),
//   jul({
//     Lang.tm: "Iýul",
//     Lang.ru: "Июль",
//     Lang.en: "July",
//   }, 7),
//   au({
//     Lang.tm: "Awgust",
//     Lang.ru: "Август",
//     Lang.en: "August",
//   }, 8),
//   se({
//     Lang.tm: "Sentýabr",
//     Lang.ru: "Сентябрь",
//     Lang.en: "September",
//   }, 9),
//   oc({
//     Lang.tm: "Oktýabr",
//     Lang.ru: "Октябрь",
//     Lang.en: "October",
//   }, 10),
//   no({
//     Lang.tm: "Noýabr",
//     Lang.ru: "Ноябрь",
//     Lang.en: "November",
//   }, 11),
//   de({
//     Lang.tm: "Dekabr",
//     Lang.ru: "Декабрь",
//     Lang.en: "December",
//   }, 12);
//   const Months(this.tag, this.toInt);
//   final Map<Lang, String> tag;
//   final int toInt;
// }

enum OrderSortType {
  highestPrice({
    Lang.tm: 'Highest price',
    Lang.ru: 'Highest price',
    Lang.en: 'Highest price',
  }, '-total_price'),
  lowestPrice({
    Lang.tm: 'Lowest price',
    Lang.ru: 'Lowest price',
    Lang.en: 'Lowest price',
  }, 'total_price'),
  first({
    Lang.tm: 'First',
    Lang.ru: 'First',
    Lang.en: 'First',
  }, 'order__created_at'),
  newest({
    Lang.tm: 'Newest',
    Lang.ru: 'Newest',
    Lang.en: 'Newest',
  }, '-order__created_at');

  const OrderSortType(this.tag, this.query);
  final Map<Lang, String> tag;
  final String query;
}
