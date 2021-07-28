import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:onex_app/constant/colors.dart';
import 'package:onex_app/constant/fonts.dart';
import 'package:onex_app/constant/keys.dart';
import 'package:onex_app/models/on_borading_model.dart';
import 'package:onex_app/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:transitioner/transitioner.dart';
import '../helpers/shared_helper.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final pageController = PageController();

  bool _isLastPage = false;

  // Helper Methods
  void submit() {
    SharedHelper.cacheData(key: ONBOARDING, value: true).then(
      (value) => {
        SharedHelper.cacheData(key: LANGUAGES, value: 'ar'),
        Transitioner(
          context: context,
          child: HomeScreen(),
          animation: AnimationType.slideTop, // Optional value
          duration: Duration(milliseconds: 1000), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.elastic, // Optional value
        ),
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<OnBoardingModel> onBoardingdata = [
      OnBoardingModel(
        imageUrl: 'assets/images/1.png',
        title: 'ابحث عن المنتج',
        description:
            'يتيح لك محرك البحث خيارات عديدة بطريقة البحث قم باختيار الطريقة المناسبة البحث بالاسم او بالباركود او رقم الموديل او بالصورة',
      ),
      OnBoardingModel(
        imageUrl: 'assets/images/2.png',
        title: 'تصفح العروض',
        description:
            'قارن الاسعار بين اشهر المتاجر الالكترونية في السعودية والخليج',
      ),
      OnBoardingModel(
        imageUrl: 'assets/images/3.png',
        title: 'تسوق اونلاين',
        description:
            'اختار المتجر المناسب واذهب اليه بسهوله لإتمام عمليه الشراء',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: submit,
            child: AutoSizeText(
              'تخطي',
              maxLines: 1,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(
          bottom: 10,
          right: 30,
          left: 30,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == onBoardingdata.length - 1) {
                    setState(() {
                      _isLastPage = true;
                    });
                  } else {
                    setState(() {
                      _isLastPage = false;
                    });
                  }
                },
                controller: pageController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      textDirection: TextDirection.rtl,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          '${onBoardingdata[index].imageUrl}',
                          width: double.infinity,
                          height: 300,
                        ),
                        SizedBox(height: 20.0),
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                          child: Column(
                            children: [
                              AutoSizeText(
                                '${onBoardingdata[index].title}',
                                textDirection: TextDirection.rtl,
                                maxLines: 1,
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ARFONT,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              AutoSizeText(
                                '${onBoardingdata[index].description}',
                                maxLines: 4,
                                textDirection: TextDirection.rtl,
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: ARFONT,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: onBoardingdata.length,
              ),
            ),
            SizedBox(height: 40.0),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: onBoardingdata.length,
                  effect: JumpingDotEffect(
                    activeDotColor: mPrimaryColor,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  backgroundColor: mPrimaryColor,
                  onPressed: () {
                    if (_isLastPage) {
                      submit();
                    } else {
                      pageController.nextPage(
                        duration: Duration(milliseconds: 750),
                        curve: Curves.ease,
                      );
                    }
                  },
                  child: Icon(Icons.keyboard_arrow_right),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
