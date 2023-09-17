
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/data/cubit/PopularImage/popular_image_state.dart';
import 'package:shopping_app/features/data/request/Popular_Request.dart';
import 'package:shopping_app/features/domain/model/PopularImage.dart';

class PopularImageCubit extends Cubit<PopularImageState> {
  PopularImageCubit() : super(PopularImageInitial());
  static PopularImageCubit get(context)=>BlocProvider.of(context);
PopularImage popularImage=PopularImage();
getdata(int id){
  emit(PopularImageLoading());
  PopularRequest.getImage(id: id, onsucsess: (value) {
    popularImage=value;
  }, onerror: (statuscode) {
    emit(PopularImageError());
  },);
}
}
