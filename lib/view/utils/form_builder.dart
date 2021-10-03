import 'package:flutter/material.dart';
import 'package:winemaker/src/user_input_utils.dart';

TextFormField getNumberFormField(TextEditingController controller, String label,
    {bool autofocus = false}) {
  return TextFormField(
    autofocus: autofocus,
    decoration: InputDecoration(labelText: label),
    keyboardType: TextInputType.number,
    validator: numberValidator,
    controller: controller,
  );
}
