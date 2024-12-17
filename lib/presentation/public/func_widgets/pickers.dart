import 'package:schools_map/config/core/exports.dart';
// import 'popup/counter_widget.dart';
// import 'popup/my_popup.dart';

class Pickers {
  static Future<DateTime?> data(DateTime initialDate) {
    return showDatePicker(
      context: AppRoute.context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
      // initialEntryMode: DatePickerEntryMode.input,
      switchToCalendarEntryModeIcon: const Icon(Icons.edit),
      switchToInputEntryModeIcon: const Icon(Icons.edit),

      builder: (context, child) {
        return child!;
      },
    );
  }

  // static Future<DateTime?> month(DateTime initialDate) async {
  //   return MyPopup(
  //     AppRoute.context,
  //     barrierDismissible: true,
  //     content: const SizedBox(
  //       width: 400,
  //       child: CounterWidget(
  //         rangeFirst: MapEntry(1, 12),
  //         rangeSecond: MapEntry(2010, 2100),
  //         h: 200,
  //       ),
  //     ),
  //   ).show().then((value) => value?.first);
  // }

  static Future<TimeOfDay?> time() {
    return showTimePicker(
      context: AppRoute.context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return child!;
      },
    );
  }
}
