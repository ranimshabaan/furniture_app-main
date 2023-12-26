import 'package:flutter/material.dart';
import 'package:furniture_app/screens/Sign_in.dart';

// define currentActiveImage
int currentActiveImage = 0;

// define home widget
class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});
   static String id = 'Onboarding';

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);

  void updateState() {
    setState(() {});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomPageView(
              callback: updateState,
              pageController: _pageController,
            ),
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildPageIndicator(2),
              ),
            ),
            BoardingButton(
              pageController: _pageController,
            ),
          ],
        ),
      
    );
  }
}

// define images viewer
class CustomPageView extends StatefulWidget {
  final VoidCallback callback;
  final PageController pageController;

  const CustomPageView(
      {required this.callback, required this.pageController, super.key});

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 2,
          controller: widget.pageController,
          onPageChanged: (index) {
            currentActiveImage = index;
            widget.callback();
          },
          itemBuilder: (context, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(child: ImageBuilder(index: index)),
                Heading(index: index),
                SubHeading(
                  index: index,
                )
              ],
            );
          }),
    );
  }
}

// define image locations
List<String> _imagesLocations = [
  "assets/images/onboarding1.jpg",
  "assets/images/onboarding2.jpg",
];

// define image item
class ImageBuilder extends StatelessWidget {
  const ImageBuilder({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    String imgPath = _imagesLocations[index];
    return Image.asset(
      imgPath,
      width: 363,
      height: 431,
      fit: BoxFit.fill,
    );
  }
}

// define onboarding headings
List<String> _headings = [
  "“Furniture is the essence of a room; it brings it to life",
  "Design is not just what it looks like and feels like.n Design is how it works.",
];

// define heading
class Heading extends StatelessWidget {
  const Heading({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    String text = _headings[index];
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20,
            color: Colors.black,
            fontFamily: "SenBold"),
      ),
    );
  }
}

// define onboarding headings
List<String> _subHeadings = [
  "The details are not the details. \n They make the design",
  "Furniture that is too obviously designed is very interesting, \n but too often belongs only in museums.",
];

// define sub-heading
class SubHeading extends StatelessWidget {
  const SubHeading({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    String text = _subHeadings[index];
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            height: 1.8),
      ),
    );
  }
}

// define page indicators
List<Widget> _buildPageIndicator(int count) {
  List<Widget> indicators = [];
  for (int i = 0; i < count; i++) {
    indicators.add(_indicator(i == currentActiveImage ? true : false));
  }
  return indicators;
}

// build indicator item
Widget _indicator(
  bool isActive,
) =>
    AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      height: 5,
      width: isActive ? 27.0 : 10.0,
      margin: const EdgeInsets.only(top: 0, right: 8, bottom: 10),
      decoration: BoxDecoration(
          color: isActive ? Colors.amber : const Color.fromRGBO(0, 0, 0, 1),
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );

// build button
class BoardingButton extends StatelessWidget {
  const BoardingButton({required this.pageController, super.key});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    late String text;
    currentActiveImage == 1 ? text = "GET STARTED" : text = "Next";
    return Container(
        height: 63,
        width: 170,
        margin: const EdgeInsets.only(top: 20, bottom: 70),
        decoration: const BoxDecoration(
            color: Colors.purple,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: MaterialButton(
          onPressed: () {
            currentActiveImage >= 1
                ? Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SignIn()))
                : pageController.nextPage(
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.ease);
          },
          child: Text(text,
              style: const TextStyle(fontSize: 17.0, color: Colors.black)),
        ));
  }
}
