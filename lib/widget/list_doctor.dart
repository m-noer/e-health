import 'package:flutter/material.dart';
import 'package:healthcare/widget/cardlist.dart';

class ListDoctor extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Center(
          child: Text("Dokter"),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              child: ListView(
                children: <Widget>[
                  CardList(
                    name: "Dr. Sitti Ashari",
                    status: "online",
                    image:
                        "https://akcdn.detik.net.id/community/media/visual/2019/04/21/60930db4-b0a2-4033-aeec-b2e1ead64a0a.jpeg?w=770&q=90",
                    spesialization: "Dokter Umum",
                    totalReview: 20,
                    distance: 1.2,
                    address: "Jalan Parangrtritis KM.20",
                  ),
                  CardList(
                    name: "Dr. Sitti Ashari",
                    status: "offline",
                    image:
                        "https://2.bp.blogspot.com/-3mE-3bMwG9Y/WYxHDjdO-6I/AAAAAAAAAoM/HSDjP6v4k78ldkpJH3nEdTdhaEBWFJh0gCEwYBhgL/s1600/13423552_976732302447483_1713343447_n.jpg",
                    spesialization: "Dokter Umum",
                    address: "Jalan Parangrtritis KM.20",
                  ),
                  CardList(
                    name: "Dr. Sitti Ashari",
                    status: "online",
                    image:
                        "https://asset-a.grid.id/crop/0x0:0x0/700x465/photo/haifoto/original/75116_indah-kusumaningrum.jpg",
                    spesialization: "Dokter Umum",
                    address: "Jalan Parangrtritis KM.20",
                  ),
                  CardList(
                    name: "Dr. Sitti Ashari",
                    status: "online",
                    image:
                        "http://d3t543lkaz1xy.cloudfront.net/photo/562739d7c98121d274124a1f",
                    spesialization: "Dokter Umum",
                    address: "Jalan Parangrtritis KM.20",
                  ),
                  CardList(
                    name: "Dr. Sitti Ashari",
                    image:
                        "http://www.garudadaily.com/wp-content/uploads/2019/01/Amanah-itu-Berat-Biar-Lia-Saja-1.png",
                    spesialization: "Dokter Umum",
                    address: "Jalan Parangrtritis KM.20",
                  ),
                  CardList(
                    name: "Dr. Sitti Ashari",
                    image:
                        "https://www.polhukam.id/wp-content/uploads/2018/09/img-20180913-wa00541883087677.jpg",
                    spesialization: "Dokter Umum",
                    address: "Jalan Parangrtritis KM.20",
                  ),
                  CardList(
                    name: "Dr. Sitti Ashari",
                    image:
                        "https://cdn-image.hipwee.com/wp-content/uploads/2018/04/hipwee-anton-tanjung.jpg",
                    spesialization: "Dokter Umum",
                    address: "Jalan Parangrtritis KM.20",
                  ),
                  CardList(
                    name: "Dr. Sitti Ashari",
                    image:
                        "https://akcdn.detik.net.id/community/media/visual/2019/04/21/60930db4-b0a2-4033-aeec-b2e1ead64a0a.jpeg?w=770&q=90",
                    spesialization: "Dokter Umum",
                    address: "Jalan Parangrtritis KM.20",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
