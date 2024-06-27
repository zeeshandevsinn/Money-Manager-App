import 'package:kamino_app/page/routes.dart';
import 'package:kamino_app/page/splash/components/on_boarding_button.dart';
import 'package:kamino_app/page/splash/on_boarding.dart';
import 'package:kamino_app/utils/constants.dart';
import 'package:kamino_app/utils/k_dimensions.dart';
import 'package:kamino_app/utils/k_images.dart';
import 'package:kamino_app/utils/k_strings.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: PageView(
                controller: _pageController,
                children: const [
                  OnBoarding(
                    image: Kimages.onBoarding1,
                    text: Kstrings.onBoardingText1,
                  ),
                  OnBoarding(
                    image: Kimages.onBoarding2,
                    text: Kstrings.onBoardingText2,
                  ),
                  OnBoarding(
                    image: Kimages.onBoarding3,
                    text: Kstrings.onBoardingText3,
                  ),
                ],
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Kdimensions.paddingSizeLarge),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (_currentIndex != 2)
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      child: Text(
                        'Skip',
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                              fontWeight: FontWeight.w700,
                              color: blackColor,
                              fontSize: 18,
                            ),
                      ),
                    ),
                  if (_currentIndex != 2) const Spacer(),
                  Flexible(
                    child: OnBoardingButton(
                      text: _currentIndex == 2 ? 'Get Started' : 'Next',
                      onPressed: () {
                        if (_currentIndex == 2) {
                          Navigator.pushReplacementNamed(context, Routes.login);
                        } else {
                          _pageController.nextPage(
                              duration: const Duration(milliseconds: 1000),
                              curve: Curves.easeInOutCubicEmphasized);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: Kdimensions.paddingSizeExtraLarge +
                  Kdimensions.paddingSizeDefault,
            ),
          ],
        ),
      ),
    );
  }
}
