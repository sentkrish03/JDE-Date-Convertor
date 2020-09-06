import 'package:intl/intl.dart';

/*Convert Greg to Julian*/
String gregToJul(String szDate) {
  int dateJ = 0;
  var formatter = new DateFormat('dd-MMM-yyyy');
  DateTime dt = formatter.parse(szDate);
  if (dt.year >= 1900 && dt.year <= 2899) {
    dateJ = (((int.parse(dt.year.toString()) * 1000) - 1900000) +
        (int.parse(DateFormat("D").format(dt))));
  }
  return dateJ.toString().padLeft(6, '0');
}

/*Convert Julian to Gregorian*/
String jultoGreg(String szDate) {
  // print(szDate);
  String dateJul = "";
  var century, yy, year, date;
  var formatter = new DateFormat('dd-MMM-yyyy');
  if (szDate.length == 6 &&
      (int.parse(szDate) > 1 && int.parse(szDate) < 999366)) {
    century = int.parse(szDate.substring(0, 1));

    yy = int.parse(szDate.substring(1, 3));
    year = 100 * (19 + century) + yy;
    date = (int.parse(szDate.substring(3, 6))) - 1;
    DateTime dt = new DateTime(year, 1, 1);
    dt = dt.add(new Duration(days: date));
    dateJul = formatter.format(dt);
  }
  return dateJul;
}

String getDateToday() {
  var now = new DateTime.now();
  var formatter = new DateFormat('dd-MMM-yyyy');
  String formattedDate = formatter.format(now);
  return (formattedDate);
}
