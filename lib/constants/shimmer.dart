import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class Shimmers {
  static shimmerReviews() {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  static shimmerCircular() {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  static shimmerSubscription() {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            for (int i = 0; i < 3; i++)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    height: 70,
                    width: 90.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ));
  }

  static shimmerTemplate() {
    return Shimmer.fromColors(
        baseColor: Colors.grey,
        highlightColor: Colors.grey.shade100,
        child: Column(
          children: [
            for (int i = 0; i < 4; i++)
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                    height: 90,
                    width: 95.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}
