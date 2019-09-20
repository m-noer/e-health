import 'package:flutter/material.dart';
import 'package:healthcare/model/profile_doctor.dart';
import 'dart:async' show Future;
import 'dart:convert';
import 'package:healthcare/widget/cardlist.dart';
import 'package:http/http.dart' as http;

class ListDoctor extends StatefulWidget {
  const ListDoctor({Key key, this.category});

  final String category;

  @override
  _ListDoctorState createState() => _ListDoctorState();
}

class _ListDoctorState extends State<ListDoctor> {
  List<ProfileDoctor> _profile = List<ProfileDoctor>();

  Future<List<ProfileDoctor>> fetchProfile() async {
    var url = 'https://m-noer.github.io/e-health/assets/data.json';
    var response = await http.get(url);

    var profiles = List<ProfileDoctor>();

    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        profiles.add(ProfileDoctor.fromJson(noteJson));
      }
    }
    return profiles;
  }

  @override
  void initState() {
    fetchProfile().then((value) {
      setState(() {
        _profile.addAll(value);
      });
    });
    super.initState();
  }

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
              child: ListView.builder(
                itemCount: _profile == null ? 0 : _profile.length,
                itemBuilder: (context, i) {
                  if (_profile[i].bidang == widget.category) {
                    return CardList(
                      name: _profile[i].nama,
                      status: _profile[i].status,
                      image: _profile[i].foto,
                      spesialization: _profile[i].bidang,
                      totalReview: 20,
                      distance: 1.2,
                      address: _profile[i].alamat,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
