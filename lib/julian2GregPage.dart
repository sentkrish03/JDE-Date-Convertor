import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './functions.dart';
import './constant.dart';

class JulianToGregPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.indigo[900],
        title: Text('Julian to Gregorian'),
      ),
      body: JulDatePicker(),
    );
  }
}

class JulDatePicker extends StatefulWidget {
  @override
  _JulDatePickerState createState() => _JulDatePickerState();
}

class _JulDatePickerState extends State<JulDatePicker> {
  // DateTime _dateTime;

  String _szDate = '';
  String _szConvDate = '';
  String _szInitialTextValue = '';
  TextEditingController _controller;

  void initState() {
    super.initState();

    _controller = TextEditingController();
    _szDate = gregToJul(getDateToday());
    _szInitialTextValue = _szDate;
    _szConvDate = jultoGreg(_szDate);

    _controller.value = _controller.value.copyWith(
      text: _szInitialTextValue,
    );
  }

  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _convDate(String value) {
    setState(() {
      _szDate = value;
      _szConvDate = jultoGreg(_szDate);
    });
  }

  // String _formatDate(DateTime dt) {
  //   var formatter = new DateFormat('dd-MMM-yyyy');
  //   String formattedDate = formatter.format(dt);
  //   return (formattedDate);
  // }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Julian Date',
              textAlign: TextAlign.left,
              style: kTextStyle1,
            ),
            SizedBox(height: 20),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                  // child: new TextFormField(
                  //   cursorWidth: 3.0,
                  //   decoration: new InputDecoration(
                  //     border: new OutlineInputBorder(
                  //       borderRadius: new BorderRadius.circular(10.0),
                  //     ),
                  //   ),
                  //   validator: (val) {
                  //     if (val.length == 0) {
                  //       return "not Valid";
                  //     } else {
                  //       return null;
                  //     }
                  //   },
                  //   keyboardType: TextInputType.number,
                  //   initialValue: '1',
                  // ),
                  child: TextField(
                    controller: _controller,
                    maxLength: 6,
                    maxLengthEnforced: true,
                    keyboardType: TextInputType.number,
                    onSubmitted: (String value) => _convDate(value),
                    onChanged: (val) {
                      if (val.length == 6) {
                        FocusScope.of(context).requestFocus(FocusNode());
                        _convDate(val);
                      }
                    },
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Text(
              'Gregorian Date',
              style: kTextStyle1,
            ),
            SizedBox(height: 20),
            Text(_szConvDate, style: kTextStyle2Bold),
            // ConvDate(
            //   iConversionMethod: 0,
            //   szDate: _szDate,
            //   szStyleName: kTextStyle2Bold,
            // ),
            SizedBox(height: 60),
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
                    }),
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
      ),
    );
  }
}
