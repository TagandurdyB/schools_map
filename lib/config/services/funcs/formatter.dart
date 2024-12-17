import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/enums.dart';
import '../../constants/hive_enums.dart';
import '../../core/entities.dart';

extension DateTimeExtension on DateTime {
  DateTime applied(TimeOfDay time) {
    return DateTime(year, month, day, time.hour, time.minute);
  }

  String dateLang(Lang lang) {
    final month = Months.values[this.month - 1];
    final weekDay = WeekDay.values[weekday - 1];
    return "${month.tag[lang]!.substring(0, 3)} ${"$day".padLeft(2, '0')}, ${weekDay.tag[lang]!.substring(0, 3)}";
  }

  String monthWord(Lang lang) {
    final month = Months.values[this.month - 1];
    return "$day ${month.tag[lang]!.substring(0, 3)} $year";
  }

  String fileFormant(){
    return '$year$month${day}_$hour$minute$second';
  }
}

extension StringExtension on String {
  bool get isNumber {
    try {
      double.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  int toInt() {
    if (isNumber) {
      return int.parse(this);
    }
    return 0;
  }

  double toDouble() {
    if (isNumber) {
      return double.parse(this);
    }
    return 0;
  }

  double toMoney() {
    String money = this;
    if (length < 3) {
      money += '.00';
    } else {
      money = substring(0, length - 2);
      money += '.';
      money += substring(length - 2);
    }
    return double.parse(money);
  }

  String changeIndex(int index, String val) {
    final incIndex = index + 1;
    return replaceRange(index, incIndex == length ? null : incIndex, val);
  }

  int numFinger() {
    String result = '';
    if (isNotEmpty) {
      for (int i = 0; i < length; i++) {
        if (this[i].isNumber) {
          result += this[i];
        } else if (result != '') {
          break;
        }
      }
    }
    return result.isEmpty ? 0 : int.parse(result);
  }

  String countryCodeToEmoji() {
    // 0x41 is Letter A
    // 0x1F1E6 is Regional Indicator Symbol Letter A
    // Example :
    // firstLetter U => 20 + 0x1F1E6
    // secondLetter S => 18 + 0x1F1E6
    // See: https://en.wikipedia.org/wiki/Regional_Indicator_Symbol
    if (length > 3) return '🌏';
    final int firstLetter = codeUnitAt(0) - 0x41 + 0x1F1E6;
    final int secondLetter = codeUnitAt(1) - 0x41 + 0x1F1E6;
    return String.fromCharCode(firstLetter) + String.fromCharCode(secondLetter);
  }
}

extension DoubleExtension on double {
  String get toPrice => toStringAsFixed(2);
}

extension IconExtension on Icon {
  Widget svg(String path) => SvgPicture.asset(
        path,
        color: color,
        width: size,
        height: size,
      );
}

class Formater {
//  String validateFormEmail(String value) {
//     if (!RegExp(
//             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//         .hasMatch(value)) {
//       return 'Please enter a valid email address';
//     }
//     return null;
//   }

  static double maxValue(List<double> list) {
    double result = 0;
    for (double l in list) {
      if (result < l) result = l;
    }
    return result;
  }

  static String rimSifr(String n) {
    switch (n) {
      case '1':
        return 'I';
      case '2':
        return 'II';
      case '3':
        return 'III';
      case '4':
        return 'IV';
      case '5':
        return 'V';
      case '6':
        return 'VI';
      case '7':
        return 'VII';
      case '8':
        return 'VIII';
      case '9':
        return 'IX';
      case '10':
        return 'X';
      default:
        return n;
    }
    // return .padLeft(2, "0");
  }

  static Widget strToSvg(
    String? str, {
    IconData iconD = Icons.question_mark_outlined,
    Color? col,
  }) {
    if (str?.isEmpty ?? true) return Icon(iconD, color: col);

    return SvgPicture.string(str!);
  }

  static String twoDigit(int n) {
    return n.toString().padLeft(2, "0");
  }

  static String calendar(DateTime? date) {
    if (date != null) {
      return "${twoDigit(date.day)}.${twoDigit(date.month)}.${date.year}";
    } else {
      return "";
    }
  }

  static String withoutYear(DateTime? date) {
    if (date != null) {
      return "${twoDigit(date.day)}.${twoDigit(date.month)}";
    } else {
      return "";
    }
  }

  static String monthYear(DateTime? date) {
    if (date != null) {
      return "${twoDigit(date.month)}/${"${date.year}".substring(2)}";
    } else {
      return "";
    }
  }

  static MapEntry<DateTime, DateTime> weekArea(DateTime? date) {
    date ??= DateTime.now();
    DateTime start = date, end = date;
    final day = date.weekday;
    start = date.subtract(Duration(days: day - 1));
    end = date.add(Duration(days: 7 - day));

    return MapEntry(start, end);
  }

  static String weekAreaStr(DateTime? date) {
    final week = weekArea(date);
    return dateDistace(week.key, week.value);
  }

  static String dateDistace(DateTime? date1, DateTime? date2) {
    if (date1 != null && date2 != null) {
      return '${withoutYear(date1)}-${withoutYear(date2)}';
    } else {
      return "";
    }
  }

  static String dayYear(DateTime? date) {
    if (date != null) {
      return "${twoDigit(date.day)}, ${date.year}";
    } else {
      return "00, 0000";
    }
  }
  //23, 2023

  static String onlyDate(DateTime? date) {
    if (date != null) {
      return "${date.year}-${twoDigit(date.month)}-${twoDigit(date.day)}";
    } else {
      return "0000-00-00";
    }
  }

  static TimeOfDay? strToTime(String? str) {
    try {
      if (str != null) {
        final strs = str.split(':');
        final hour = int.parse(strs.first);
        final minute = int.parse(strs.last);
        return TimeOfDay(hour: hour, minute: minute);
      }
    } catch (e) {
      debugPrint('++Error in strToTime(): $e');
    }
    return null;
  }

  static bool isMidle(TimeOfDay start, TimeOfDay end) {
    final midle = TimeOfDay.now();
    if (start.hour < midle.hour && midle.hour < end.hour) {
      if (start.minute < midle.minute && midle.minute < end.minute) {
        return true;
      }
    }
    return false;
  }

  static bool isLater(DateTime? date) {
    if (date != null) {
      if (nowDiff(date).inMinutes < 0) {
        return true;
      }
    }
    return false;
  }

  static bool isDateLaterOrEq(DateTime? date) {
    if (date != null) {
      if (nowDiff(date).inMinutes < 0) {
        return true;
      }
    }
    return false;
  }

  static bool eqDate(DateTime? date, DateTime? date2) {
    if (date != null && date2 != null) {
      return onlyDate(date) == onlyDate(date2);
    }
    return false;
  }

  static DateTime? nextWeek(DateTime? date) {
    if (date != null) {
      final now = DateTime.now();
      if (now.day > date.day) {
        return date.add(const Duration(days: 7));
      }
    }
    return date;
  }

  static String calendarClock(DateTime? date) {
    if (date == null) {
      return "";
    } else {
      date = date.toLocal();
      return "${twoDigit(date.day)}.${twoDigit(date.month)}.${date.year} ${twoDigit(date.hour)}:${twoDigit(date.minute)}";
    }
  }

  static int weekDay() {
    int day = DateTime.now().weekday;
    if (day == 7) day = 6;
    return day - 1;
  }

  static String colckHour(DateTime? date) {
    if (date == null) return '';
    return "${twoDigit(date.hour)}:${twoDigit(date.minute)}";
  }

  static String colckMin(DateTime date) {
    return "${twoDigit(date.minute)}:${twoDigit(date.second)}";
  }

  static String cronometr(Duration duration) {
    return "${twoDigit(duration.inMinutes.remainder(60))}:${twoDigit(duration.inSeconds.remainder(60))}";
  }

  static Duration nowDiff(DateTime date) {
    return DateTime.now().difference(date);
  }

  // static String ago(DateTime? date, {required Dictionary dic}) {
  //   if (date != null) {
  //     final diff = nowDiff(date);
  //     if (diff.inDays > 365) {
  //       return '${diff.inDays ~/ 365} ${dic.year} ${dic.ago}';
  //     } else if (diff.inDays > 30) {
  //       return '${diff.inDays ~/ 30} ${dic.month} ${dic.ago}';
  //     } else if (diff.inDays >= 1) {
  //       return '${diff.inDays} ${dic.day} ${dic.ago}';
  //     } else if (diff.inHours >= 1) {
  //       return '${diff.inHours} ${dic.hour} ${dic.ago}';
  //     } else if (diff.inMinutes >= 1) {
  //       return '${diff.inMinutes} ${dic.minut} ${dic.ago}';
  //     } else if (diff.inSeconds >= 1) {
  //       return '${diff.inSeconds} ${dic.seconds} ${dic.ago}';
  //     } else {
  //       return dic.justNow;
  //     }
  //   } else {
  //     return "";
  //   }
  // }

  static String rounder(int num) {
    final int length = "$num".length;
    return "${num > 999 ? "${"$num".substring(0, length - 3)},${"$num".substring(length - 3)}" : num}";
  }

  static List<String> tagSeperator(String tags) {
    List<String> tagList = tags.replaceAll("#", " #").split(' ');
    tagList.removeAt(0);
    return tagList;
  }

  static String locations(List<String> locations) {
    String str = "";
    for (var element in locations) {
      final e = welayatCode(element);
      str = "$str $e,";
    }
    return str.substring(0, str.length - 1);
  }

  static String phone(String? phone) {
    if (phone == null) return '';
    if (phone.length > 5) {
      String result = phone;
      if (result.substring(0, 4).toUpperCase() == "TEL:") {
        result = result.substring(4);
      }
      if (result.length == 6) {
        result = "+99365$result";
      }
      if (result.length == 11) {
        result = "+$result";
      }
      if (result[0] == "8") {
        result = "+993${result.substring(1)}";
      } else if (result.substring(0, 4) != "+993") {
        result = "+993$result";
      }
      if (result.length == 12) {
        result = String.fromCharCode(43) + result.substring(1);
        return result;
      }
    }
    return '';
  }

  static String welayatCode(String wel) {
    switch (wel) {
      case "Aşgabat":
        return "AG";
      case "Balkan":
        return "BN";
      case "Ahal":
        return "AH";
      case "Mary":
        return "MR";
      case "Lebap":
        return "LB";
      case "Daşoguz":
        return "DZ";
      default:
        return "TM";
    }
  }

  static bool searcher(List<String> items, String item) {
    final result = items.where((element) => element == item);
    return result.isNotEmpty;
  }

  static bool hasChar(String str) {
    int length = 0;
    for (int i = 0; i <= 9; i++) {
      if (str.contains("$i")) length++;
    }
    for (int i = 0; i < simbols.length; i++) {
      if (str.contains(simbols[i])) length++;
    }
    final int finalLength = str.length - length;
    return finalLength > 0;
  }

  static bool isUpperCase(String letter) {
    if (!hasChar(letter)) return false;
    return letter == letter.toUpperCase();
  }

  static bool hasUpper(String text) {
    for (int i = 0; i < text.length; i++) {
      if (isUpperCase(text[i])) return true;
    }
    return false;
  }

  static bool isLowerCase(String letter) {
    if (!hasChar(letter)) return false;
    return letter == letter.toLowerCase();
  }

  static bool hasLower(String text) {
    for (int i = 0; i < text.length; i++) {
      if (isLowerCase(text[i])) return true;
    }
    return false;
  }

  static bool hasNum(String text) {
    for (int i = 0; i <= 9; i++) {
      if (text.contains("$i")) return true;
    }
    return false;
  }

  static List simbols = [
    "!",
    "@",
    "#",
    "\$",
    "%",
    "^",
    "&",
    "*",
    "(",
    ")",
    "-",
    "_",
    "+",
    "=",
    " ",
    "/",
    " ",
    "'",
    "\"",
    ".",
    ",",
  ];
  static bool hasSimbol(String text) {
    for (int i = 0; i < simbols.length; i++) {
      if (text.contains(simbols[i])) return true;
    }
    return false;
  }

  static int modFinder(double price, double discount) {
    if (price > discount && discount > 0) {
      final double mod = (discount * 100 / price);
      if (mod.floor() == 100) {
        return 99;
      } else {
        return 100 - mod.floor();
      }
    }
    return 0;
  }
}
