import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/base/viewModel/base_view_model.dart';
import '../../../core/exports/constants_exports.dart';
import '../model/post_model.dart';
import 'home_view_event.dart';
import 'home_view_state.dart';

class HomeViewBloc extends Bloc<HomeViewEvent, HomeViewState>
    with BaseViewModel {
  HomeViewBloc() : super(HomeViewInitialState()) {
    on<HomeViewGetPostsEvent>(getPostsEvent);
  }

  List<Child> posts = [];

  FutureOr<void> getPostsEvent(
      HomeViewGetPostsEvent event, Emitter<HomeViewState> emit) async {
    emit(HomeViewLoadingState());
    var res = await networkService!.send<PostModel, PostModel>(
      EndPointConstants.posts,
      type: HttpTypes.get,
      parseModel: PostModel(),
    );
    if (res is PostModel) {
      posts = res.data!.children!;
      emit(HomeViewSuccessState(res.data!.children!));
    } else {
      emit(HomeViewFailureState('Unknown error'));
    }
  }
}
