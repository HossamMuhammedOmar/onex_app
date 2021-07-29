import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());

  //? Call Provider
  static HomeCubit get(context) => BlocProvider.of(context);

  //* VARIABLES

  //* METHODS

}
