import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import './functions.dart';
import './constant.dart';

class GregToJulianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Greg to Julian'),
      ),
      body: DatePicker(),
      
    );
  }
}

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _dateTime;

  String _szConvDate;
  String szDate;

  String formatDate(DateTime dt) {
    var formatter = new DateFormat('dd-MMM-yyyy');
    String formattedDate = formatter.format(dt);
    return (formattedDate);
  }

  void initState() {
    super.initState();
    _convDate(DateTime.now());
  }

  void _convDate(DateTime dt) {
    if (dt == null) {
      _szConvDate = gregToJul(formatDate(DateTime.now()));
    } else {
      _szConvDate = gregToJul(formatDate(dt));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Gregorian Date',
            textAlign: TextAlign.left,
            style: kTextStyle1,
          ),
          SizedBox(height: 20),
          InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(mainAxisSize: MainAxisSize.min, children: [
                  new Text('     '),
                  new Text(
                    _dateTime == null
                        ? formatDate(DateTime.now())
                        : formatDate(_dateTime),
                    style: kTextStyle2Bold,
                  ),
                  new Icon(Icons.arrow_drop_down),
                ]),
              ],
            ),
            onTap: () {
              showDatePicker(
                      context: context,
                      initialDate:
                          _dateTime == null ? DateTime.now() : _dateTime,
                      firstDate: DateTime(1900, 01, 01),
                      lastDate: DateTime(2899, 12, 31))
                  .then((date) {
                setState(() {
                  _dateTime = date;
                  _convDate(_dateTime);
                });
              });
            },
          ),
          SizedBox(
            height: 80,
          ),
          Text(
            'Julian Date',
            style: kTextStyle1,
          ),
          SizedBox(height: 20),
          Text(_szConvDate, style: kTextStyle2Bold),
          // ConvDate(
          //   iConversionMethod: 1,
          //   szDate: _dateTime == null
          //       ? formatDate(DateTime.now())
          //       : formatDate(_dateTime),
          //   szStyleName: kTextStyle2Bold,
          // ),
          SizedBox(height: 125),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                child: new Icon(
                  Icons.content_copy,
                  color: Colors.indigo[900],
                  size: 40,
                ),
                onTap: () {
                  Clipboard.setData(new ClipboardData(text: _szConvDate))
                      .then((_) {
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('$_szConvDate to Cliboard'),
                      ),
                    );
                  });
                },
              ),
              // new Text('         '),
              // new Icon(
              //   Icons.share,
              //   color: Colors.indigo[900],
              //   size: 40,
              // )
            ],
          )
        ],
      ),
    );
  }
}
