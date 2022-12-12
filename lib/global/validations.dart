String? validateText(String? text) {
  if (text == null || text.isEmpty) {
    return 'Must have value';
  }
  return null;
}
