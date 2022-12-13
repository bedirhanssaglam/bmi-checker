validateOperation(dynamic value, String errorMessage,
    {int minCharacterCount = 0}) {
  if (value == null || value.isEmpty || value.length < minCharacterCount) {
    return errorMessage;
  }
  return null;
}
