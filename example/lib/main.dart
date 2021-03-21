import 'package:example/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final PageController _controller = PageController();

  final List<_SliderModel> mySlides = [
    _SliderModel(
      imageAssetPath: Image.asset(
        'assets/images/main_logo.png',
        scale: 1,
      ),
      title: 'Developer Student Club',
      desc: 'discover people',
      minTitleFontSize: 10,
      descStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      titleStyle: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/images/logo_vitbhopal.png'),
      title: 'Developer Student Club',
      desc: 'discover people',
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/images/developer_gif.gif'),
      title: 'Developer Student Club',
      desc: 'discover people',
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/images/backgroundImg.png'),
      title: 'Developer Student Club',
      desc: 'discover people',
    ),
    _SliderModel(
      imageAssetPath: Image.asset('assets/images/main_logo.png'),
      title: 'Developer Student Club',
      desc: 'discover people',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      label: const Text(
        'Get Started',
        key: Key('get_started'),
      ),

      /// This function works when you will complete `OnBoarding`
      function: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => HomeScreen(),
          ),
        );
      },

      /// This [mySlides] must not be more than 5.
      mySlides: mySlides,
      controller: _controller,
      slideIndex: 0,
      statusBarColor: Colors.white,
      indicators: Indicators.cool,
      skipPosition: SkipPosition.bottomRight,
      skipDecoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(20.0),
      ),
      skipStyle: TextStyle(color: Colors.white),

      pageIndicatorColorList: [
        Colors.yellow,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.blue
      ],
    );
  }
}

class _SliderModel {
  const _SliderModel({
    this.imageAssetPath,
    this.title = "title",
    this.desc = "title",
    this.miniDescFontSize = 12.0,
    this.minTitleFontSize = 15.0,
    this.descStyle,
    this.titleStyle,
  });

  final Image? imageAssetPath;
  final String title;
  final TextStyle? titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle? descStyle;
  final double miniDescFontSize;
}
