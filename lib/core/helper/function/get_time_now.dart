import 'package:intl/intl.dart';

String getTimeNow() {
  final now = DateTime.now();
  return DateFormat(" h:mm a dd/MM/yyyy").format(now);
}