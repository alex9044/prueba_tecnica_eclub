class FormatNumber {
  static String formatDouble(double number) {
    String formattedNumber = number.toStringAsFixed(2);

    // Apartar de la parte decimal
    List<String> parts = formattedNumber.split('.');
    String integerPart = parts[0];

    String formattedInteger = '';
    for (int i = integerPart.length - 1; i >= 0; i--) {
      formattedInteger = integerPart[i] + formattedInteger;
      if ((integerPart.length - i) % 3 == 0 && i > 0) {
        formattedInteger = '.$formattedInteger';
      }
    }
    return formattedInteger;
  }
}
