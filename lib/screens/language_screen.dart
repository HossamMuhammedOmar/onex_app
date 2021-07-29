import 'dart:async';
import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:onex_app/bloc/lang/cubit.dart';
import 'package:onex_app/constant/colors.dart';
import 'package:onex_app/constant/fonts.dart';
import 'package:onex_app/constant/keys.dart';
import 'package:onex_app/helpers/shared_helper.dart';
import 'package:onex_app/widgets/navigation_drawer_widget.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:transitioner/transitioner.dart';

class LanguageScreen extends StatelessWidget {
  final lang = SharedHelper.getCacheData(key: LANGUAGES);
  final RoundedLoadingButtonController _btnArabicController =
      RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnEnglishController =
      RoundedLoadingButtonController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawerScrimColor: Colors.black.withOpacity(0.7),
      endDrawer: lang == 'ar' ? NavigationDrawerWidget() : null,
      drawer: lang == 'en' ? NavigationDrawerWidget() : null,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          '${LanguagesCubit.get(context).languageSetting()}',
          style: TextStyle(
            color: mGreyColor,
            fontFamily: lang == 'ar' ? ARFONT : ENFONT,
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) {
          return Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: constraint.maxHeight / 3,
                  child: Image.asset('assets/images/change_lang.jpg'),
                ),
                SizedBox(height: 30),
                AutoSizeText(
                  'Choose Language',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    fontFamily: ENFONT,
                  ),
                ),
                SizedBox(height: 30),
                RoundedLoadingButton(
                  child: Text(
                    'English',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ENFONT,
                      fontSize: 16,
                    ),
                  ),
                  controller: _btnEnglishController,
                  onPressed: () => _changeToEnglish(context),
                ),
                SizedBox(height: 10),
                RoundedLoadingButton(
                  color: Color(0xffFFC344),
                  child: Text(
                    'Arabic',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: ENFONT,
                      fontSize: 16,
                    ),
                  ),
                  controller: _btnArabicController,
                  onPressed: () => _changeToArabic(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _changeToArabic(context) async {
    Timer(Duration(seconds: 1), () {
      SharedHelper.cacheData(key: LANGUAGES, value: 'ar');
      _btnArabicController.success();
      Transitioner(
        context: context,
        child: LanguageScreen(),
        animation: AnimationType.scale,
        duration: Duration(milliseconds: 500),
        replacement: true,
        curveType: CurveType.elastic,
      );
    });
  }

  void _changeToEnglish(context) async {
    Timer(Duration(seconds: 1), () {
      SharedHelper.cacheData(key: LANGUAGES, value: 'en');
      _btnEnglishController.success();

      Transitioner(
        context: context,
        child: LanguageScreen(),
        animation: AnimationType.scale,
        duration: Duration(milliseconds: 500),
        replacement: true,
        curveType: CurveType.elastic,
      );
    });
  }
}
