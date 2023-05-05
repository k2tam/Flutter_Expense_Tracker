import 'package:intl/intl.dart';

class DateFormatter {
  final dateFormatter = DateFormat.yMd();

  String formatDateToString(DateTime dateTime) {
    return dateFormatter.format(dateTime);
  }
}
