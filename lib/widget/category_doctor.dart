import 'package:flutter/material.dart';
import 'package:healthcare/widget/list_doctor.dart';
import 'package:healthcare/widget/transition.dart';

class CategoryDoctor extends StatelessWidget {
  const CategoryDoctor({Key key, this.icon, this.category}) : super(key: key);

  final String icon;
  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20.0),
        height: 100,
        width: 100,
        child: RaisedButton(
          padding: EdgeInsets.all(10.0),
          hoverColor: Colors.blue,
          highlightColor: Colors.white,
          splashColor: Colors.white,
          color: Colors.white,
          elevation: 2,
          onPressed: () {
            Navigator.push(context, SlideRightRoute(page: ListDoctor()));
          },
          child: Column(
            children: <Widget>[
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(icon),
                  ),
                ),
              ),
              Text(
                category,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ));
  }
}
