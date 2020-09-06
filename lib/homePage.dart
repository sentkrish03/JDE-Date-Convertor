import 'package:flutter/material.dart';

import './constant.dart';
import './homeDateCard.dart';
import './functions.dart';
import './greg2JulianPage.dart';
import './julian2GregPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ClipPath(
          clipper: MyClipper(),
          child: Container(
              padding: EdgeInsets.only(left: 40, top: 60, right: 40),
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF3383CD),
                    Color(0xFF11249F),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    heightFactor: 0.9,
                    child: Image.asset("assets/images/calendar_3.png"),
                  ),
                  Center(
                    child: Text(
                      'Julian Date Convertor',
                      style: kHeadingTextStyle.copyWith(color: Colors.white),
                    ),
                  )
                ],
              )),
        ),
        Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Today\'s Gregorian Date',
                      style: kTextStyle1Bold,
                    ),
                    Spacer(),
                    Text(getDateToday(), style: kTextStyle1),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Today\'s Julian Date',
                      style: kTextStyle1Bold,
                    ),
                    Spacer(),
                    Text(gregToJul(getDateToday()), style: kTextStyle1),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.only(left: 30, right: 30),
                width: double.infinity,
                child: Row(
                  children: <Widget>[
                    InkWell(
                      child: DateCard(
                        image: "assets/images/calendar_1.png",
                        title: "Greg to Julian",
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new GregToJulianPage(),
                          ),
                        );
                      },
                    ),
                    Spacer(),
                    InkWell(
                      child: DateCard(
                        image: "assets/images/calendar_2.png",
                        title: "Julian To Greg",
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                            builder: (context) => new JulianToGregPage(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 75),
      ],
    ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 4, size.height, size.width, size.height - 75);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
