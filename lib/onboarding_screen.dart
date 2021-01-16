import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_screen/widgets/pageIndicator.dart';

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  final List mySlides;
  final List<Color> pageIndicatorColorList;
  int slideIndex;
  final String label;
  final PageController controller;
  final Function function;
  final Color scaffoldColor;
  final Color statusBarColor;
  final Color startGradientColor;
  final Color endGradientColor;
  final TextStyle skipStyle;
  final Brightness statusBarIconBrightness;

  OnBoardingScreen(
      {this.label = "Button",
      this.mySlides = const [],
      this.controller,
      this.slideIndex = 0,
      this.skipStyle = const TextStyle(
          fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black),
      this.function,
      this.startGradientColor = const Color(0xffffffff),
      this.endGradientColor = const Color(0xffffffff),
      this.statusBarColor = const Color(0xffffffff),
      this.scaffoldColor = const Color(0xffffffff),
      this.statusBarIconBrightness = Brightness.dark,
      this.pageIndicatorColorList = const [
        Colors.blue,
        Colors.red,
        Colors.yellow,
        Colors.blue,
        Colors.green,
        Colors.red,
      ]});
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: widget.statusBarColor,
        statusBarIconBrightness: widget.statusBarIconBrightness,
      ),
    );
    if (widget.mySlides.length > 6) {
      print("");
      return Scaffold(
        body: SafeArea(
          child: Container(
              child: Center(
            child: Text(
              "Error the lenght of mySLides list can't be more than 6.\nThis means we have limit of 6 tabview on onborading screen.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          )),
        ),
      );
    }
    return Scaffold(
      backgroundColor: widget.scaffoldColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                widget.startGradientColor,
                widget.endGradientColor,
              ],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        if (widget.controller.hasClients) {
                          widget.controller.animateToPage(
                              widget.mySlides.length - 1,
                              duration: Duration(milliseconds: 400),
                              curve: Curves.linear);
                        }
                      },
                      child: Text(
                        "skip >",
                        style: widget.skipStyle,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                flex: 8,
                child: PageView.builder(
                  itemCount: widget.mySlides.length,
                  controller: widget.controller,
                  onPageChanged: (index) {
                    setState(() {
                      widget.slideIndex = index;
                    });
                  },
                  itemBuilder: (_, index) => SlideTile(
                    image: widget.mySlides[index].imageAssetPath,
                    title: widget.mySlides[index].title,
                    desc: widget.mySlides[index].desc,
                    isFirst: true,
                    minTitleFontSize: widget.mySlides[index].minTitleFontSize,
                    miniDescFontSize: widget.mySlides[index].miniDescFontSize,
                    titleStye: widget.mySlides[index].titleStyle,
                    descStyle: widget.mySlides[index].descStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: widget.function,
                      child: widget.slideIndex == widget.mySlides.length - 1
                          ? Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                widget.label,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                            )
                          : Padding(
                              padding: const EdgeInsets.symmetric(vertical: 30),
                            ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < widget.mySlides.length; i++)
                          i == widget.slideIndex
                              ? buildPageIndicator(
                                  true,
                                  widget.pageIndicatorColorList[
                                      widget.pageIndicatorColorList.length -
                                          i -
                                          1],
                                )
                              : buildPageIndicator(
                                  false,
                                  widget.pageIndicatorColorList[
                                      widget.pageIndicatorColorList.length -
                                          i -
                                          1],
                                ),
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTile extends StatelessWidget {
  final Widget image;
  final String title, desc;
  final bool isFirst;
  final double minTitleFontSize;
  final TextStyle titleStye;
  final TextStyle descStyle;
  final double miniDescFontSize;

  SlideTile({
    this.image,
    this.title,
    this.desc,
    this.isFirst = false,
    this.minTitleFontSize,
    this.miniDescFontSize,
    this.titleStye,
    this.descStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          SizedBox(
            height: 8,
          ),
          AutoSizeText(
            title,
            minFontSize: minTitleFontSize,
            maxLines: 1,
            style: titleStye,
          ),
          AutoSizeText(
            desc,
            minFontSize: miniDescFontSize,
            maxLines: 1,
            style: descStyle,
          )
        ],
      ),
    );
  }
}
