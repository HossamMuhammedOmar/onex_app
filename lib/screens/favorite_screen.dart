import 'package:flutter/material.dart';
import 'package:onex_app/bloc/lang/cubit.dart';
import 'package:onex_app/constant/colors.dart';
import 'package:onex_app/constant/fonts.dart';
import 'package:onex_app/constant/keys.dart';
import 'package:onex_app/helpers/shared_helper.dart';
import 'package:onex_app/widgets/navigation_drawer_widget.dart';

class FavoriteScreen extends StatelessWidget {
  final lang = SharedHelper.getCacheData(key: LANGUAGES);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black.withOpacity(0.7),
      endDrawer: lang == 'ar' ? NavigationDrawerWidget() : null,
      drawer: lang == 'en' ? NavigationDrawerWidget() : null,
      appBar: AppBar(
        leading: lang == 'ar'
            ? IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              )
            : null,
        title: Text(
          '${LanguagesCubit.get(context).favorite()}',
          style: TextStyle(
            fontFamily: lang == 'ar' ? ARFONT : ENFONT,
          ),
        ),
        backgroundColor: mPrimaryColor,
      ),
      body: Center(
        child: Text('Favorite Screen'),
      ),
    );
  }
}
