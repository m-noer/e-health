import 'package:flutter/material.dart';

import 'package:healthcare/widget/consultation_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Healthcare',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConsultationPage(),
    );
  }
}
