import 'package:flutter/material.dart';
import 'package:flutter_course/pet_app_ui/consts.dart';
import 'package:flutter_course/pet_app_ui/models/onboards.dart';
import 'package:flutter_course/pet_app_ui/pets_home_screen.dart';

class PetsOnboardingScreen extends StatefulWidget {
  const PetsOnboardingScreen({super.key});

  @override
  State<PetsOnboardingScreen> createState() => _PetsOnboardingScreenState();
}

class _PetsOnboardingScreenState extends State<PetsOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: screenSize.height * 0.7,
            color: Colors.white,
            child: PageView.builder(
              itemCount: onboards.length,
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              itemBuilder: (context, index) {
                return onBoardingItems(screenSize, index);
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_currentPage == onboards.length - 1) {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (_) => PetsHomeScreen()),
                  (route) => false,
                );
              } else {
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
            child: Container(
              height: 70,
              width: screenSize.width * 0.6,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  _currentPage == onboards.length - 1
                      ? 'Get Started'
                      : 'Continue',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              onboards.length,
              (index) => indicatorForSlider(index),
            ),
          ),
        ],
      ),
    );
  }

  Widget indicatorForSlider(int? index) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      width: _currentPage == index ? 20 : 10,
      height: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: _currentPage == index
            ? Colors.orange
            : Colors.black.withAlpha(51),
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Column onBoardingItems(Size screenSize, int index) {
    return Column(
      children: [
        Container(
          height: screenSize.height * 0.4,
          width: screenSize.width * 0.9,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    height: 240,
                    width: screenSize.width * 0.9,
                    color: orangeContainer,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 5,
                          left: -40,
                          height: 130,
                          width: 130,
                          child: Transform.rotate(
                            angle: -11,
                            child: Image.asset(
                              'assets/pets-image/claw.png',
                              color: pawColor1,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: -20,
                          right: -20,
                          height: 130,
                          width: 130,
                          child: Transform.rotate(
                            angle: -12,
                            child: Image.asset(
                              'assets/pets-image/claw.png',
                              color: pawColor1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                right: 60,
                child: Image.asset(
                  onboards[index].image,
                  height: 375,
                  fit: BoxFit.fill,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 30),
        Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w900,
              color: black,
            ),
            children: [
              TextSpan(text: 'Find You '),
              TextSpan(
                text: 'Dream\n',
                style: TextStyle(color: Colors.lightBlue),
              ),
              TextSpan(text: 'Pet Here'),
            ],
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          onboards[index].text,
          style: TextStyle(fontSize: 15.5, color: Colors.black38),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
