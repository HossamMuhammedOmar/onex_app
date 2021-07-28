import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:onex_app/bloc/lang/cubit.dart';
import 'package:onex_app/constant/colors.dart';
import 'package:onex_app/constant/fonts.dart';
import 'package:onex_app/constant/keys.dart';
import 'package:onex_app/helpers/shared_helper.dart';
import 'package:onex_app/screens/categories_screen.dart';
import 'package:onex_app/screens/favorite_screen.dart';
import 'package:onex_app/screens/home_screen.dart';
import 'package:onex_app/screens/language_screen.dart';
import 'package:onex_app/screens/login_screen.dart';
import 'package:transitioner/transitioner.dart';

class NavigationDrawerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100),
                child: Image.asset('assets/images/logo.png'),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Divider(color: mGreyColor.withOpacity(.5)),
                    const SizedBox(height: 24),
                    _buildMenuItem(
                      text: '${LanguagesCubit.get(context).homeScreenText()}',
                      icon: Icons.home_filled,
                      onClick: () => _selectedItem(context, 0),
                    ),
                    const SizedBox(height: 16),
                    _buildMenuItem(
                      text: '${LanguagesCubit.get(context).categories()}',
                      icon: Icons.language,
                      onClick: () => _selectedItem(context, 1),
                    ),
                    const SizedBox(height: 16),
                    _buildMenuItem(
                      text: '${LanguagesCubit.get(context).favorite()}',
                      icon: Icons.history,
                      onClick: () => _selectedItem(context, 2),
                    ),
                    const SizedBox(height: 16),
                    _buildMenuItem(
                      text: '${LanguagesCubit.get(context).changeLanguage()}',
                      icon: Icons.beenhere_outlined,
                      onClick: () => _selectedItem(context, 3),
                    ),
                    const SizedBox(height: 16),
                    _buildMenuItem(
                      text: '${LanguagesCubit.get(context).logout()}',
                      icon: Icons.logout,
                      onClick: () => _selectedItem(context, 4),
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

  Widget _buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClick,
  }) {
    return ListTile(
      title: AutoSizeText(
        '$text',
        textDirection: SharedHelper.getCacheData(key: LANGUAGES) == 'ar'
            ? TextDirection.rtl
            : TextDirection.ltr,
        maxLines: 3,
        style: TextStyle(
          fontFamily: SharedHelper.getCacheData(key: LANGUAGES) == 'ar'
              ? ARFONT
              : 'AlKshrl',
        ),
      ),
      trailing: SharedHelper.getCacheData(key: LANGUAGES) == 'ar'
          ? Icon(
              icon,
              color: mSecondaryColor,
            )
          : Icon(null),
      leading: SharedHelper.getCacheData(key: LANGUAGES) == 'en'
          ? Icon(
              icon,
              color: mPrimaryColor,
            )
          : Icon(null),
      onTap: onClick,
      hoverColor: mGreyColor,
    );
  }

  void _selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Transitioner(
          context: context,
          child: HomeScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 800), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 1:
        Transitioner(
          context: context,
          child: CategoriesScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 800), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 2:
        Transitioner(
          context: context,
          child: FavoriteScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 300), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 3:
        Transitioner(
          context: context,
          child: LanguageScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 300), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
      case 4:
        Transitioner(
          context: context,
          child: LoginScreen(),
          animation: AnimationType.fadeIn, // Optional value
          duration: Duration(milliseconds: 300), // Optional value
          replacement: true, // Optional value
          curveType: CurveType.decelerate, // Optional value
        );
        break;
    }
  }
}
