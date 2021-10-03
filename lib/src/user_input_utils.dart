double parseDoubleInput(String value) {
  return double.parse(value.replaceFirst(',', '.'));
}

String? numberValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter value';
  }
  if (double.tryParse(value.replaceFirst(',', '.')) == null) {
    return 'Value must be a number';
  }
  return null;
}
