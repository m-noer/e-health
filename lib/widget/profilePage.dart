import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:healthcare/widget/custom_appbar.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class ProfilDokter extends StatelessWidget {
  ProfilDokter({
    Key key,
    this.name,
    this.image,
    this.spesialization,
  }) : super(key: key);

  final String name;
  final String image;
  final String spesialization;

  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  final List<CircularStackEntry> data = <CircularStackEntry>[
    new CircularStackEntry(
      <CircularSegmentEntry>[
        new CircularSegmentEntry(600.0, Colors.red[300], rankKey: 'Q1'),
        new CircularSegmentEntry(1000.0, Colors.pink[50], rankKey: 'Q2'),
      ],
      rankKey: 'Quarterly Profits',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CustomAppBar(),
        body: SafeArea(
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(image),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  child: Text(
                    name,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  child: Text(spesialization),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.pink[100],
                              ),
                              padding: EdgeInsets.all(5),
                              width: 170,
                              height: 45,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Text(
                                    'Ruangan :',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Text(
                                    '70/90',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                  Container(
                                      child: new AnimatedCircularChart(
                                    key: _chartKey,
                                    size: Size(60.0, 60.0),
                                    initialChartData: data,
                                    chartType: CircularChartType.Radial,
                                    holeRadius: 7,
                                  ))
                                ],
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                    bottomRight: Radius.circular(10)),
                                color: Colors.orange[100],
                              ),
                              padding: EdgeInsets.all(5),
                              width: 150,
                              height: 45,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                    'Pasien minggu ini',
                                    style: TextStyle(color: Colors.orange[300]),
                                  ),
                                  Text(
                                    '70',
                                    style: TextStyle(
                                        color: Colors.orange[300],
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  color: Colors.green[100],
                                ),
                                padding: EdgeInsets.all(5),
                                width: 150,
                                height: 45,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Jam Praktik',
                                      style:
                                          TextStyle(color: Colors.green[300]),
                                    ),
                                    Text(
                                      '17.00-23.00 WIB',
                                      style: TextStyle(
                                          color: Colors.green[300],
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10)),
                                  color: Colors.purple[100],
                                ),
                                padding: EdgeInsets.all(5),
                                width: 150,
                                height: 45,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      'Riwayat Praktik',
                                      style:
                                          TextStyle(color: Colors.purple[300]),
                                    ),
                                    Text(
                                      '2010 - Sekarang',
                                      style: TextStyle(
                                          color: Colors.purple[300],
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Text(
                            'Jadwal Praktek dr.Cindy Amelia',
                            style: TextStyle(
                                color: Colors.blue[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                        ),
                        Container(
                          child: Expanded(
                            child: Timeline.builder(
                              itemBuilder: (BuildContext context, int i) {
                                return TimelineModel(
                                  Container(
                                    height: 133,
                                    width: 150,
                                    margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          '09.00-13.00',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text('Rs.Condongcatur'),
                                      ],
                                    ),
                                  ),
                                  iconBackground: Colors.green,
                                );
                              },
                              position: TimelinePosition.Left,
                              itemCount: 5,
                              physics: BouncingScrollPhysics(),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
