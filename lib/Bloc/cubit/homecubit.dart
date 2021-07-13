import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/Bloc/model/datamodel.dart';

import 'homestate.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  List<Model> list = [
    Model( id:1,name: 'Abcd',title: 'Abdcfhk jhkjjjk'),
    Model( id:2,name: 'Abcdef',title: 'ghjh ghgjh kj '),
  ];
  fetchData() {
    emit(HomeLoading());
    Future.delayed(Duration(seconds: 1), () => emit(HomeLoaded(list)));
  }

  addData(Model dataModel) {
    emit(HomeLoading());
    list.add(dataModel);
    Future.delayed(Duration(seconds: 1), () => emit(HomeLoaded(list)));
  }

  updateData({required Model dataModel, required int position}) {
    emit(HomeLoading());
    list[position] = dataModel;
    Future.delayed(Duration(seconds: 1), () => emit(HomeLoaded(list)));
  }

   deleteData(int position) {
     emit(HomeLoading());
     list.removeAt(position);
     Future.delayed(Duration(seconds: 1), () => emit(HomeLoaded(list)));
   }
}