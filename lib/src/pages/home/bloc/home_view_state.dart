import 'package:equatable/equatable.dart';

import '../model/post_model.dart';

abstract class HomeViewState extends Equatable {
  @override
  List<Object> get props => [];
}

class HomeViewInitialState extends HomeViewState {}

class HomeViewSuccessState extends HomeViewState {
  late final List<Child> posts;

  HomeViewSuccessState(this.posts);

  @override
  List<Object> get props => [posts];
}

class HomeViewFailureState extends HomeViewState {
  final String? message;

  HomeViewFailureState(this.message);
}

class HomeViewLoadingState extends HomeViewState {}
