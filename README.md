# onboarding_screen
A customizable onboarding screen for your flutter apps

## Getting Started

To install the package
1. `onboarding_screen: ^0.0.2` (copy this and paste it in your pubspec.yaml file )
2. `flutter pub get` run this command
3. `import 'package:onboarding_screen/onboarding_screen.dart';` copy and this statment into your project and start using it.

# How this package works
<img src="https://raw.githubusercontent.com/beximo/onboarding_screen/master/readme_files/demo.gif" height="460" width="240"/>

# Status
- [x] Onboarding screen with custom option - Complete
- [ ] Animations remaining


# How to use:
* Example code

```dart
import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboarding_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      label: const Text('Get Started'),

      /// This function works when you will complete `OnBoarding`
      function: () {
        print('Navigation');
      },

      /// This [mySlides] must not be more than 5.
      mySlides: mySlides,
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

  final Image imageAssetPath;
  final String title;
  final TextStyle titleStyle;
  final double minTitleFontSize;
  final String desc;
  final TextStyle descStyle;
  final double miniDescFontSize;
}


```


# Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request. Here are some basic rules to follow to ensure timely addition of your request:

1.  Match the document style as closely as possible.
2.  Please keep PR titles easy to read and descriptive of changes, this will make them easier to merge :)
3.  Pull requests _must_ be made against `master` branch for this particular repository.
4.  Check for existing [issues](https://github.com/woinbo/onboarding_screen/issues) first, before filing an issue.
5.  Make sure you follow the set standard as all other projects in this repo do
6.  Have fun!

### Created & Maintained By

[Ankit sagar](https://github.com/woinbo) ([Twitter](https://www.twitter.com/woinbo)) ([YouTube](https://www.youtube.com/c/beximo))
([Instagram](https://www.instagram.com/woinbo))

### Contributors
* [Abhishek](https://github.com/Abhishek01039)



## Getting Started

For help getting started with Flutter, view our online
[documentation](http://flutter.io/).

For help on editing plugin code, view the [documentation](https://pub.dev/documentation/onboarding_screen/latest/).
