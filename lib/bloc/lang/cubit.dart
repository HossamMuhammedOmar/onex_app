import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onex_app/constant/keys.dart';
import 'package:onex_app/helpers/shared_helper.dart';

import 'states.dart';

class LanguagesCubit extends Cubit<LanguagesState> {
  LanguagesCubit() : super(InitLangState());

  static LanguagesCubit get(context) => BlocProvider.of(context);

  void changeToArabic() {
    SharedHelper.cacheData(key: LANGUAGES, value: 'ar');
    emit(LanguageArabicState());
  }

  void changeToEnglish() {
    SharedHelper.cacheData(key: LANGUAGES, value: 'en');
    emit(LanguageEnglishState());
  }

  String homeScreenText() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'ar') {
      return 'الصفحه الرئيسيه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'en') {
      return 'Home Screen';
    }
    return '';
  }

  String categories() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'ar') {
      return 'الأقسام';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'en') {
      return 'Categories';
    }
    return '';
  }

  String changeLanguage() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'ar') {
      return 'تغيير اللغه';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'en') {
      return 'Change Language';
    }
    return '';
  }

  String favorite() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'ar') {
      return 'مفضلتي';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'en') {
      return 'Favorite';
    }
    return '';
  }

  String loginOrRegister() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'ar') {
      return 'دخول/تسجيل';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'en') {
      return 'Login/Register';
    }
    return '';
  }

  String logout() {
    if (SharedHelper.getCacheData(key: LANGUAGES) == 'ar') {
      return 'تسجيل الخروج';
    } else if (SharedHelper.getCacheData(key: LANGUAGES) == 'en') {
      return 'Logout';
    }
    return '';
  }
}
