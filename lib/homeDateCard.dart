import 'package:flutter/material.dart';
import './constant.dart';

class DateCard extends StatelessWidget {
  final String image;
  final String title;

  const DateCard({
    Key key,
    this.image,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 120),
          Text(
            title,
            style: kTextStyle1Bold,
          )
        ],
      ),
    );
  }
}
