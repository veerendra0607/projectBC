String? isValidNumber(String? value) {
  final pattern = RegExp(r'^[0-9]+$');

  if (value == null || value.trim().isEmpty) {
    return "Quantity can not be empty";
  } else if ((!pattern.hasMatch(value.trim()) ||
      value.trim().length > 0 ||
      value.trim().length < 0)) {
    return " submited Quantity should not be 0";
  } else {
    return null;
  }
}