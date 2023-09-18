


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Popular/features/data/cubit/Popularinfo/popular_info_state.dart';
import 'package:Popular/features/data/request/Popular_Request.dart';
import 'package:Popular/features/domain/model/PopularImage.dart';
import 'package:Popular/features/domain/model/Popularinfo.dart';

class PopularInfoCubit extends Cubit<PopularInfoState> {
  PopularInfoCubit() : super(PopularInfoInitial());
  static PopularInfoCubit get(context)=>BlocProvider.of(context);

  Popularinfo popularinfo=Popularinfo();
  getpopularInfo(int id){
    emit(PopularInfoloading());
    PopularRequest.getinfo(id: id, onsucsess: (value) {
   popularinfo=value;
   emit(PopularInfoLoaded());
 }, onerror: (statuscode) {
   emit(Popularinfoerror());
 },);
   }
  PopularImage popularImage=PopularImage();
  getdata(int id){
    emit(PopularImageLoading());
    PopularRequest.getImage(id: id, onsucsess: (value) {
      popularImage=value;
      emit(PopularImageloaded());
    }, onerror: (statuscode) {
      emit(PopularImageError());
    },);
}}
