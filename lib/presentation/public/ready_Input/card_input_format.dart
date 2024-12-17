part of 'input_widget.dart';

class CardInputFormat extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    String enteredData = newValue.text;
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < enteredData.length; i++) {
      buffer.write(enteredData[i]);
      final index = i + 1;
      if (index % 4 == 0 && enteredData.length != index) {
        buffer.write(" ");
      }
    }

    return TextEditingValue(
      text: buffer.toString(),
      selection: TextSelection.collapsed(offset: buffer.toString().length),
    );
  }
}
