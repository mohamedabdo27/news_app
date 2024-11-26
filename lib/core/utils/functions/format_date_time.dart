import 'package:intl/intl.dart';

String formatDatTime(String date) {
  final DateTime dateTime = DateTime.parse(date);
  return DateFormat("dd/MM/yyyy").format(dateTime.toLocal());
}
