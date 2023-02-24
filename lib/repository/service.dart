String? isValidNumber(String? value) {
  final pattern = RegExp(r'^[1-9]+$');

  if (value == null || value.trim().isEmpty) {
    return "submited Quantity should not be 0";
  }
  else if ((!pattern.hasMatch(value.trim()) || value==0)) {
    return " submited Quantity should not be 0";
  }
  else {
    return null;
  }
}