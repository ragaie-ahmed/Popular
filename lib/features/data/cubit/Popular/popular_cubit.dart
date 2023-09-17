

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/data/cubit/Popular/popular_state.dart';
import 'package:shopping_app/features/data/request/Popular_Request.dart';
import 'package:shopping_app/features/domain/model/PopularModel.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());
  static PopularCubit get(context)=>BlocProvider.of(context);
  List<Results> PouplarList=[];
  void fetchdata(){
    emit(Popularloading());
    PopularRequest.getPopular(onsucsess: (value) {
      PouplarList=value!;
      emit(PopularLoaded());
    }, onerror: (statuscode) {
      emit(Popularerror());
    },);
  }
}
