class ValidatorCustom{
  String validateRequired(String value) {
    if (value.isEmpty) {
      return 'Please, fill this field';
    }
    return null;
  }
}