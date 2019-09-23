import 'package:flutter/material.dart';
import 'package:healthcare/widget/payment.dart';
import 'package:healthcare/widget/rating.dart';
import 'package:healthcare/widget/transition.dart';

import 'profilePage.dart';

class CardList extends StatelessWidget {
  const CardList(
      {Key key,
      this.name,
      this.status,
      this.image,
      this.spesialization,
      this.totalReview,
      this.distance,
      this.address})
      : super(key: key);

  final String name;
  final String status;
  final String image;
  final String spesialization;
  final int totalReview;
  final double distance;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0, bottom: 5.0),
      elevation: 1,
      child: Container(
        margin: EdgeInsets.all(10.0),
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        // border: Border.all(color: Colors.white),
                        borderRadius:
                            new BorderRadius.all(Radius.circular(100)),
                        image: DecorationImage(
                          image: NetworkImage(image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      right: 6.0,
                      bottom: 6.0,
                      child: Container(
                        height: 15.0,
                        width: 15.0,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          color: status == "online"
                              ? Colors.greenAccent[400]
                              : Colors.grey,
                          borderRadius:
                              new BorderRadius.all(Radius.circular(100)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 14.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      name,
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 20.0,
                        // letterSpacing: 0.4,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      spesialization,
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(
                      height: 4.0,
                    ),
                    Container(
                      child: Rating(
                        totalReview: totalReview,
                        distance: distance,
                      ),
                    ),
                    SizedBox(
                      height: 2.0,
                    ),
                    Text(
                      address,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        ButtonTheme(
                          height: 30.0,
                          child: RaisedButton(
                            elevation: 0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                SlideRightRoute(
                                  page: ProfilDokter(
                                    name: name,
                                    image: image,
                                    spesialization: spesialization,
                                  ),
                                ),
                              );
                            },
                            child: Text("Profile"),
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                              side: BorderSide(color: Colors.blue),
                            ),
                            textColor: Colors.blue,
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        ButtonTheme(
                          minWidth: 110,
                          height: 30.0,
                          child: RaisedButton(
                            elevation: 0,
                            onPressed: () {
                              if (status == "online") {
                                Navigator.push(
                                  context,
                                  SlideRightRoute(
                                    page: Payment(
                                      name: name,
                                      image: image,
                                      status: status,
                                      spesialization: spesialization,
                                    ),
                                  ),
                                );
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(
                                      'Kami akan mengirimkan notifikasi saat dokter $name online'),
                                  duration: Duration(seconds: 3),
                                ));
                              }
                            },
                            child: status == "online"
                                ? Text("CHAT")
                                : Text("NOTIFY ME"),
                            color: status == "online"
                                ? Colors.blue
                                : Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(4.0),
                            ),
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
