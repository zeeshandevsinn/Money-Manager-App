import 'package:flutter/services.dart';

class DollarInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.isEmpty) {
      return newValue.copyWith(text: '\$');
    }
    if (text == '\$') {
      return newValue;
    }
    final cleanedText = text.replaceAll(RegExp(r'[^\d]'), '');
    final newText = '\$' + cleanedText;
    return newValue.copyWith(
      text: newText,
      selection: TextSelection.collapsed(offset: newText.length),
    );
  }
}
