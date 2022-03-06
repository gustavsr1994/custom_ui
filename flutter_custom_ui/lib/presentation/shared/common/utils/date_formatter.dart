import 'package:intl/intl.dart';

class DateFormatter {
  String formatBackend(DateTime value) {
    var dateFormat = new DateFormat('dd-MM-yyyy');
    String output = dateFormat.format(value);
    return output;
  }

  String formatView(String value) {
    var dateFormat = DateFormat('dd-MM-yyyy');
    var date = dateFormat.parse(value);
    var output = DateFormat('dd MMM yyyy');
    return output.format(date);
  }

  String getCurrentTime(DateTime now) {
    var dateFormat = new DateFormat('HH:mm');
    String output = dateFormat.format(now);
    return output;
  }
}
