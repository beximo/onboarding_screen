# onboarding_screen
A customizable onboarding screen for you flutter apps

## Getting Started

To install the package
1. `onboarding_screen: ^0.0.1` ( copy this and paste it in your pubspec.yml file )
2. `flutter pub get` run this command
3. `import 'package:onboarding_screen/onboarding_screen.dart';` copy and this statment into your project and start using it.

# screen recording of the package
<img src="./readme_files/demo.gif" width="130" height="250"/>

# How to use:
* Example code

```dart

import 'package:flutter/material.dart';
import 'package:onboarding_screen/onboarding_screen.dart';
import 'package:example/models/onBoardingModel.dart'; // model of your onBoarding Screen
import 'package:example/configs/assets.dart'; // you app images and gif in assets folder

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding screen Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Onboarding screen demo'),
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
  List<SliderModel> mySLides; // list for containg slides data
  PageController _controller; // page controller

  @override
  void initState() {
    mySLides = getSlides(); // get all data from getSlides function
    _controller = PageController(); // initialize page controller
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OnBoardingScreen(
      label: "< Get Started />", // label is the button text
      function: () {
        print("Navigation");
      }, // function is the call back for label button you can perform action such as navigating to home screen or any thing
      mySlides: mySLides, // pass the slides list to mySlides 
      controller: _controller, // pass page controller to controller
      slideIndex: 0, // start index of your onboarding screen
    );
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

> If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of :coffee:
>
> - ![PayTm](./readme_files/PayTM.jpg)



## Getting Started

For help getting started with Flutter, view our online
[documentation](http://flutter.io/).

For help on editing plugin code, view the [documentation](https://flutter.io/platform-plugins/#edit-code).
