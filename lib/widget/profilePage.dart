import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[ProfileInfo(), DetailInfo(), HistorySick()],
      ),
    );
  }
}

class DetailInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                infoAja(
                  Icons.date_range,
                  "Age",
                  "20",
                ),
                infoAja(
                  Icons.favorite,
                  'Darah',
                  "B",
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new infoAja(Icons.favorite, 'Tinggi', '180'),
                new infoAja(Icons.memory, 'berat', '10 kg')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class infoAja extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const infoAja(
    this.icon,
    this.label,
    this.value, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Container(
            height: 50.0,
            width: 50.0,
            child: Icon(this.icon),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              shape: BoxShape.circle,
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10.0, top: 0.0),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    this.label,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Container(child: Text(this.value))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 90.0,
              width: 90.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://upload.wikimedia.org/wikipedia/commons/5/53/Gerard_Butler_%2829681162176%29.jpg"))),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Erman Junaidi',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
            Container(
              child: Text(
                'Semarang',
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HistorySick extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Text(
            'Riwayat Penyakit',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Sakit Gigi',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Dr. Vega',
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                'Cabut Semua Gigi',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 80.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.indigo,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Sakit Kepala',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text('Dr. Agung',
                                  style: TextStyle(color: Colors.white)),
                              Text(
                                'Pijat Kepala',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
