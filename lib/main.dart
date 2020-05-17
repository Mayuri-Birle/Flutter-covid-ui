import 'dart:ui';

import 'package:covid/constant.dart';
import 'package:covid/widgets/counter.dart';

import 'package:covid/widgets/myheader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid 19',
      theme: ThemeData(
          scaffoldBackgroundColor: kBackgroundColor,
          fontFamily: 'Poppins',
          textTheme: TextTheme(
            body1: TextStyle(color: kBodyTextColor),
          )),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
                  child: Column(
      children: <Widget>[
          MyHeader(image:"assets/images/doctor.png",textTop: "All you need",textBottom: "is Stay at Home",),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                  color: Color(0xffe5e5e5),
                )),
            child: Row(
              children: <Widget>[
                SvgPicture.asset(
                  "assets/icons/icons8-google-maps.svg",
                  color: Colors.blueAccent,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: DropdownButton(
                    isExpanded: true,
                    underline: SizedBox(),
                    icon: SvgPicture.asset(
                      "assets/icons/drop.svg",
                      height: 10,
                      width: 10,
                    ),
                    value: "India",
                    items: ['India', 'USA', 'China', 'Indonesia']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                          value: value, child: Text(value));
                    }).toList(),
                    onChanged: (value) {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: <Widget>[
              Row(
                children: <Widget>[
                  RichText(
                    text: TextSpan(children: [
                      TextSpan(
                        text: "Case Update\n",
                        style: kTitleTextstyle,
                      ),
                      TextSpan(
                        text: "Newest update April 24",
                        style: TextStyle(
                          color: kTextLightColor,
                        ),
                      ),
                    ]),
                  ),
                  Spacer(),
                  Text(
                    "See Details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    (BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    )),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Counter(
                        color: kInfectedColor,
                        title: "Infected",
                        number: 1046,
                      ),
                      Counter(
                        color: kDeathColor,
                        title: "Deaths",
                        number: 87,
                      ),
                      Counter(
                        color: kRecovercolor,
                        title: "Recovered",
                        number: 67,
                      ),
                    ]),
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Spread Of Virus",
                    style: kTitleTextstyle,
                  ),
                  Text(
                    "See Details",
                    style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.all(20),
                height: 178,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 10),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: Image.asset(
                  "assets/images/outbreak-coronavirus-world_0.png",
                  height: 10,
                  width: 10,
                  fit: BoxFit.contain,
                ),
              ),
            ]),
          ),
      ],
    ),
        ));
  }
}


