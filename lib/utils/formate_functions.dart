import 'package:intl/intl.dart';


/// Date Formate Fuhnction
String formatDateTime(DateTime dateTime) {
  final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
  return formatter.format(dateTime);
}


/// Number Formate Fuhnction
String formatDouble(double value) {
    String result;
    String valueString = value.toString();

    // Determine if the value has leading zeros after the decimal point
    if (valueString.contains('.')) {
      int decimalIndex = valueString.indexOf('.');
      String afterDecimal = valueString.substring(decimalIndex + 1);

      if (afterDecimal.startsWith('0')) {
        // Count the leading zeros and get significant digits up to three places
        int leadingZerosCount = 0;
        for (int i = 0; i < afterDecimal.length; i++) {
          if (afterDecimal[i] == '0') {
            leadingZerosCount++;
          } else {
            break;
          }
        }
        int significantDigits = leadingZerosCount + 3;

        // Convert back to double and then to string with significant digits
        result =
            double.parse(value.toStringAsFixed(significantDigits)).toString();
      } else {
        // Truncate to three decimal places
        result = value.toStringAsFixed(3);
      }
    } else {
      // If there's no decimal point, just return the value as is
      result = valueString;
    }

    return result;
  }