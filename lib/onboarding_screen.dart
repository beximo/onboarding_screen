import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onboarding_screen/widgets/page_indicator.dart';

enum Indicators { circle, line, cool }

enum SkipPosition { topRight, topLeft, bottomRight, bottomLeft }

// ignore: must_be_immutable
class OnBoardingScreen extends StatefulWidget {
  OnBoardingScreen({
    Key? key,
    this.label = const Text('Button'),
    this.mySlides = const [],
    required this.controller,
    this.slideIndex = 0,
    this.indicators = Indicators.circle,
    this.skipPosition = SkipPosition.topRight,
    this.skipStyle = const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    ),
    this.skipDecoration,
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
    ],
  })  : assert(mySlides.length < 6, 'Slides\'s size must not be more than 5'),
        super(key: key);

  /// list of sliders, max 5 slides are supported till now
  final List mySlides;

  /// color of each cicle slide Indicators
  final List<Color?>? pageIndicatorColorList;

  /// current slider index
  int? slideIndex;

  ///type of slide indicators [circle,line]
  final Indicators indicators;

  ///Skip Position
  final SkipPosition skipPosition;

  /// label at the last slider
  final Text? label;

  /// controller of slider
  final PageController controller;

  /// defines what to do after pressing [label]
  final Function()? function;

  /// color of scaffold
  final Color? scaffoldColor;

  /// color of status bar
  final Color? statusBarColor;

  final Color? startGradientColor;
  final Color? endGradientColor;

  /// style of skip text
  final TextStyle? skipStyle;

  /// skip button style
  final Decoration? skipDecoration;

  /// Brightness of status bar icon
  final Brightness? statusBarIconBrightness;

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: widget.statusBarColor,
        statusBarIconBrightness: widget.statusBarIconBrightness,
      ),
    );
    return Scaffold(
      backgroundColor: widget.scaffoldColor,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              widget.startGradientColor!,
              widget.endGradientColor!,
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              right: widget.skipPosition == SkipPosition.topRight
                  ? 0
                  : widget.skipPosition == SkipPosition.bottomRight
                      ? 0
                      : null,
              top: widget.skipPosition == SkipPosition.topRight
                  ? 0
                  : widget.skipPosition == SkipPosition.topLeft
                      ? 0
                      : null,
              left: widget.skipPosition == SkipPosition.topLeft
                  ? 0
                  : widget.skipPosition == SkipPosition.bottomLeft
                      ? 0
                      : null,
              bottom: widget.skipPosition == SkipPosition.bottomLeft
                  ? 0
                  : widget.skipPosition == SkipPosition.bottomRight
                      ? 0
                      : null,
              child: Container(
                margin: const EdgeInsets.only(
                    top: 32, right: 8, left: 8, bottom: 20),
                padding: const EdgeInsets.all(8.0),
                decoration: widget.skipDecoration,
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
                    'skip >>',
                    style: widget.skipStyle,
                  ),
                ),
              ),
            ),
            Column(
              children: [
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
                    itemBuilder: (_, index) => _SlideTile(
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
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: widget.function,
                        child: widget.slideIndex == widget.mySlides.length - 1
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                child: widget.label)
                            : const Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 30),
                              ),
                      ),
                      (widget.indicators == Indicators.circle)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                for (int i = 0; i < widget.mySlides.length; i++)
                                  i == widget.slideIndex
                                      ? circleIndicator(
                                          true,
                                          widget.pageIndicatorColorList![widget
                                                  .pageIndicatorColorList!
                                                  .length -
                                              i -
                                              1],
                                        )
                                      : circleIndicator(
                                          false,
                                          widget.pageIndicatorColorList![widget
                                                  .pageIndicatorColorList!
                                                  .length -
                                              i -
                                              1]!,
                                        ),
                              ],
                            )
                          : (widget.indicators == Indicators.line)
                              ? Row(
                                  children: [
                                    for (int i = 0;
                                        i < widget.mySlides.length;
                                        i++,)
                                      i == widget.slideIndex
                                          ? lineIndicator(
                                              slideIndex: widget.slideIndex,
                                              index: i,
                                              activeColor: Color(0xff2455EF),
                                              unactiveColor: Color(0xffBDCCFA),
                                            )
                                          : lineIndicator(
                                              slideIndex: widget.slideIndex,
                                              index: i,
                                              activeColor: Color(0xff2455EF),
                                              unactiveColor: Color(0xffBDCCFA),
                                            ),
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = 0;
                                        i < widget.mySlides.length;
                                        i++,)
                                      i == widget.slideIndex
                                          ? coolIndicator(
                                              slideIndex: widget.slideIndex,
                                              index: i,
                                              activeColor: Color(0xff2455EF),
                                              unactiveColor: Color(0xffBDCCFA),
                                            )
                                          : coolIndicator(
                                              slideIndex: widget.slideIndex,
                                              index: i,
                                              activeColor: Color(0xff2455EF),
                                              unactiveColor: Color(0xffBDCCFA),
                                            ),
                                  ],
                                ),
                      const SizedBox(
                        height: 6,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}

class _SlideTile extends StatelessWidget {
  final Widget? image;
  final String? title, desc;
  final bool isFirst;
  final double? minTitleFontSize;
  final TextStyle? titleStye;
  final TextStyle? descStyle;
  final double? miniDescFontSize;

  const _SlideTile({
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
      padding: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image!,
          const SizedBox(
            height: 8,
          ),
          AutoSizeText(
            title!,
            minFontSize: minTitleFontSize!,
            maxLines: 1,
            style: titleStye,
          ),
          AutoSizeText(
            desc!,
            minFontSize: miniDescFontSize!,
            maxLines: 1,
            style: descStyle,
          )
        ],
      ),
    );
  }
}
