import 'package:intl/intl.dart';

class CurrentDate {
  late String complete;
  CurrentDate() {
    DateTime date = DateTime.now();
    complete = DateFormat('EEEE, d MMM, yyyy').format(date).toString();
  }
}
