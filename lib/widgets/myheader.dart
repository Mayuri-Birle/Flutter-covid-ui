import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constant.dart';
import 'counter.dart';
import 'info_screen.dart';

class MyHeader extends StatelessWidget {
  final String image;
  final String textTop;
  final String textBottom;
  const MyHeader({
    Key key,
    this.image,
    this.textTop,
    this.textBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          // image: DecorationImage(
          //   image: AssetImage("assets/images/medical-mask.png"),

          // ),
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF3383cd),
                Color(0xff11249f),
              ]),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return InfoScreen();
                        },
                      ),
                    );
                  },
                  child: SvgPicture.asset(
                    "assets/icons/list.svg",
                    height: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                  child: Stack(
                children: <Widget>[
                  Image.asset(
                    image,
                    height: 250,
                    width: 250,
                    alignment: Alignment.topLeft,
                  ),
                  Positioned(
                    top: 20,
                    left: 170,
                    child: Text(
                      "$textTop \n $textBottom",
                      style: kHeadingTextStyle.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(),
                ],
              )),
            ]),
      ),
    );
  }
}
