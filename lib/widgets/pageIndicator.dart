import 'package:flutter/material.dart';

Widget buildPageIndicator(bool isCurrentPage, Color color) {
  return Container(
    margin: EdgeInsets.only(left: 2.0, right: 2.0, bottom: 5.0),
    height: isCurrentPage ? 10.0 : 6.0,
    width: isCurrentPage ? 10.0 : 6.0,
    decoration: BoxDecoration(
      color: isCurrentPage ? color : Colors.transparent,
      border: isCurrentPage
          ? Border.all(color: Colors.transparent)
          : Border.all(color: color),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}
