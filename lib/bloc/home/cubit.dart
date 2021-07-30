import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:onex_app/constant/end_point.dart';
import 'package:onex_app/helpers/dio_helper.dart';
import 'package:onex_app/models/banners_model.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  //? Call Provider
  static HomeCubit get(context) => BlocProvider.of(context);

  //* VARIABLES
  BannersModel? bannersModel;

  //* METHODS

  // GET ALL BANNERS
  void getBanners() {
    emit(GetBannersLoadingState());
    DioHelper.getData(url: '$BANNERS').then(
      (value) {
        bannersModel = BannersModel.fromJson(value.data);
        print(bannersModel!.data);
        emit(GetBannersSuccessState());
      },
    ).catchError(
      (e) {
        print(e.toString());
        emit(GetBannersErrorState());
      },
    );
  }
}
