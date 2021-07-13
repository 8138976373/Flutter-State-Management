
import 'package:flutter/cupertino.dart';
import 'package:flutter_state_management/Bloc/model/datamodel.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Model> list;
  HomeLoaded(this.list);
}
