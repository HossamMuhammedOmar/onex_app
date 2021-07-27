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
}
