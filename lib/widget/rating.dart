import 'package:flutter/material.dart';
import 'package:rating_bar/rating_bar.dart';

class Rating extends StatelessWidget {
  const Rating({
    Key key,
    @required this.totalReview,
    @required this.distance,
  }) : super(key: key);

  final int totalReview;
  final double distance;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RatingBar.readOnly(
          size: 20.0,
          filledColor: Colors.amber,
          initialRating: 3.5,
          isHalfAllowed: true,
          halfFilledIcon: Icons.star_half,
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
        ),
        Text(
          "($totalReview) \u00B7 $distance mi",
          style: TextStyle(
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
