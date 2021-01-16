import 'package:flutter/material.dart';

class SliderModel {
  final Image imageAssetPath;
  final String title;
  final TextStyle titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle descStyle;
  final double miniDescFontSize;

  SliderModel({
    this.imageAssetPath,
    this.title = "title",
    this.desc = "title",
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    this.descStyle,
    this.titleStyle,
  });
}
