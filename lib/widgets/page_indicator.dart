import 'package:flutter/material.dart';

//Cicle Indicator widget

Widget circleIndicator(bool isCurrentPage, Color? color) {
  return Container(
    margin: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 5.0),
    height: isCurrentPage ? 10.0 : 6.0,
    width: isCurrentPage ? 10.0 : 6.0,
    decoration: BoxDecoration(
      color: isCurrentPage ? color : Colors.transparent,
      border: isCurrentPage
          ? Border.all(color: Colors.transparent)
          : Border.all(color: color!),
      borderRadius: BorderRadius.circular(12),
    ),
  );
}

//Line Indicator widget

Widget lineIndicator({
  int? slideIndex = 0,
  int? index = 0,
  Color? activeColor = const Color(0xff2455EF),
  Color? unactiveColor = const Color(0xffBDCCFA),
}) {
  return Expanded(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.only(left: 0.0, right: 0.0, bottom: 5.0),
            height: 2.0,
            decoration: BoxDecoration(
              color: index! <= slideIndex! ? activeColor : unactiveColor,
            ),
          ),
        ),
      ],
    ),
  );
}

//cool Indicator widget

Widget coolIndicator({
  int? slideIndex = 0,
  int? index = 0,
  Color? activeColor = const Color(0xff000000),
  Color? unactiveColor = const Color(0xffFFFFFF),
}) {
  return Container(
    margin: const EdgeInsets.only(left: 1.0, right: 1.0, bottom: 0.0),
    height: slideIndex == index ? 4 : 3,
    width: slideIndex == index ? 20 : 3,
    decoration: BoxDecoration(
      color: index! <= slideIndex! ? activeColor : unactiveColor,
      borderRadius: BorderRadius.all(
        Radius.circular(
          70.0,
        ),
      ),
    ),
  );
}
