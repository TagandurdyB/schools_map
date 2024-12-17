// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';


Map<String, TextEditingController> readyInputBase = {};

class RIBase {
  static String getText(String tag) {
    if (readyInputBase[tag] == null) {
      return "";
    } else {
      return readyInputBase[tag]!.text;
    }
  }

  static TextEditingController getControl(String tag) {
    if (readyInputBase[tag] == null) {
      return TextEditingController();
    } else {
      return readyInputBase[tag]!;
    }
  }

  static void addText(String tag, String text) {
    readyInputBase.addAll({tag: TextEditingController(text: text)});
  }

  static void changeDate(String tag, TextEditingController control) {
    readyInputBase.addAll({tag: control});
  }

  static bool isEmpety(String tag) {
    if (readyInputBase[tag] == null) {
      return true;
    } else if (readyInputBase[tag]!.text == "") {
      return true;
    } else {
      return false;
    }
  }

  static void eraseDate(String tag) {
    readyInputBase.addAll({tag: TextEditingController()});
  }
}
