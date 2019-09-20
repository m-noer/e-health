import 'package:flutter/material.dart';
import 'package:healthcare/widget/transition.dart';

class CardConsultation extends StatelessWidget {
  const CardConsultation({
    Key key,
    this.icon,
    this.header,
    this.details,
    this.iconInfo,
    this.color1,
    this.color2,
    this.route,
  }) : super(key: key);

  final String icon;
  final String header;
  final String details;
  final String iconInfo;
  final Color color1;
  final Color color2;
  final Widget route;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, SlideRightRoute(page: route));
      },
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 10.0),
            height: 200.0,
            width: double.infinity,
            padding: EdgeInsets.all(26.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              gradient: new LinearGradient(
                colors: [color1, color2],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.5, 0.0),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp,
              ),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(icon),
                    ),
                  ),
                ),
                SizedBox(
                  width: 14.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      header,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      width: 190,
                      child: Text(
                        details,
                        style: TextStyle(color: Colors.white, fontSize: 14.0),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 24.0,
            right: 14.0,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 30.0,
                width: 30.0,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40.0),
                    image: DecorationImage(
                      image: AssetImage(iconInfo),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
