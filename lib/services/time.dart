import 'package:intl/intl.dart';

class Time {
  late String formattedTime;
  Time() {
    DateTime now = DateTime.now();
    String time = DateFormat.Hm().format(now);
    var num = int.parse(time.substring(0, 2));
    if (num >= 12 && num < 16) {
      formattedTime = "Good Afternoon";
    } else if (num >= 16 && num <= 23) {
      formattedTime = "Good Evening";
    } else {
      formattedTime = "Good Morning";
    }
  }
}
