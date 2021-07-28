import 'package:flutter/material.dart';
import 'package:onex_app/bloc/lang/cubit.dart';
import 'package:onex_app/constant/colors.dart';
import 'package:onex_app/constant/keys.dart';
import 'package:onex_app/helpers/shared_helper.dart';
import 'package:onex_app/widgets/navigation_drawer_widget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black.withOpacity(0.7),
      endDrawer: SharedHelper.getCacheData(key: LANGUAGES) == 'ar'
          ? NavigationDrawerWidget()
          : null,
      drawer: SharedHelper.getCacheData(key: LANGUAGES) == 'en'
          ? NavigationDrawerWidget()
          : null,
      appBar: AppBar(
        title: Text('${LanguagesCubit.get(context).homeScreenText()}'),
        backgroundColor: mPrimaryColor,
      ),
      body: Center(
        child: Text(
          'Home Screen',
        ),
      ),
    );
  }
}
