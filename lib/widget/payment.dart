import 'package:flutter/material.dart';
import 'package:healthcare/widget/chat_page.dart';
import 'package:healthcare/widget/transition.dart';

class Payment extends StatelessWidget {
  const Payment(
      {Key key, this.name, this.image, this.status, this.spesialization})
      : super(key: key);

  final String name;
  final String image;
  final String status;
  final String spesialization;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.only(left: 12),
          child: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Text("Pembayaran"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0),
            height: 100,
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: <Widget>[
                  Container(
                    height: 70.0,
                    width: 70.0,
                    decoration: BoxDecoration(
                      borderRadius: new BorderRadius.all(Radius.circular(200)),
                      image: DecorationImage(
                          image: NetworkImage(image), fit: BoxFit.cover),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.grey[700],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            wordSpacing: 1.0),
                      ),
                      Text(
                        spesialization,
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Ringkasan pembayaran",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Biaya Sesi untuk 30 menit",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        "Rp 25.000",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Bayar",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Rp 25.000",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Metode pembayaran",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 16.0,
                  ),
                  FlatButton(
                    onPressed: () {},
                    padding: EdgeInsets.all(0.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 70,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/icon/ovo.png"),
                            ),
                          ),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.greenAccent[400],
                          size: 30.0,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          alignment: Alignment.bottomCenter,
          height: 80.0,
          width: double.infinity,
          child: Center(
            child: ButtonTheme(
              padding: EdgeInsets.all(10.0),
              minWidth: 320.0,
              height: 46.0,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(6.0),
              ),
              child: RaisedButton(
                elevation: 0,
                onPressed: () {
                  Navigator.push(
                      context,
                      SlideRightRoute(
                          page: Chat(
                        name: name,
                        image: image,
                        status: status,
                      )));
                },
                child: Text("BAYAR DAN KONFIRMASI"),
                color: Colors.blue,
                textColor: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
