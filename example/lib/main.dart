import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboarding_screen.dart';
import 'package:example/models/onBoardingModel.dart';
import 'package:example/configs/assets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SliderModel> mySLides;
  PageController _controller;

  @override
  void initState() {
    mySLides = getSlides();
    _controller = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
        label: Text("< Get Started />"),
        function: () {
          print("Navigation");
        },
        mySlides: mySLides,
        controller: _controller,
        slideIndex: 0,
        statusBarColor: Colors.red,
        startGradientColor: Colors.red,
        endGradientColor: Colors.blue,
        skipStyle: TextStyle(color: Colors.white),
        pageIndicatorColorList: [
          Colors.white,
          Colors.green,
          Colors.red,
          Colors.yellow,
          Colors.white
        ]);
  }
}

List<SliderModel> getSlides() {
  List<SliderModel> slides = [
    SliderModel(
      imageAssetPath: Image.asset(
        Assets.dsc_logo,
        scale: 1,
      ),
      title: "Developer Student Club",
      desc: "discover people",
      minTitleFontSize: 10,
      descStyle: TextStyle(
          fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
      titleStyle: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w400, color: Colors.black),
    ),
    SliderModel(
      imageAssetPath: Image.asset(Assets.vitb_dsc_logo),
      title: "Developer Student Club",
      desc: "discover people",
    ),
    SliderModel(
      imageAssetPath: Image.asset(Assets.thirdPage),
      title: "Developer Student Club",
      desc: "discover people",
    ),
    SliderModel(
      imageAssetPath: Image.asset(Assets.containerBackgroundImg),
      title: "Developer Student Club",
      desc: "discover people",
    ),
    SliderModel(
      imageAssetPath: Image.asset(Assets.dsc_logo),
      title: "Developer Student Club",
      desc: "discover people",
    ),
  ];

  return slides;
}
