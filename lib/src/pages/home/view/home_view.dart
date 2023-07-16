import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_view_bloc.dart';
import '../bloc/home_view_state.dart';
import '../widget/home_refresh_indicator.dart';
import '../widget/loading_button.dart';
import '../widget/postList/post_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewBloc bloc;

  @override
  void initState() {
    super.initState();
    if (mounted == true) {
      bloc = BlocProvider.of<HomeViewBloc>(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Reddit'),
            centerTitle: false,
            pinned: true,
          ),
          const HomeRefreshIndicator(),
          BlocBuilder<HomeViewBloc, HomeViewState>(
            buildWhen: (HomeViewState oldState, HomeViewState newState) {
              if (oldState is HomeViewSuccessState &&
                  newState is HomeViewLoadingState) {
                // sayfa daha önceden yüklenmişse ve refresh ediliyorsa
                if (oldState.posts == bloc.posts) {
                  // sayfadayı yenilediğinde liste aynıysa
                  return false;
                } else {
                  return true;
                }
              }
              return true;
            },
            builder: (BuildContext context, state) {
              if (state is HomeViewLoadingState) {
                return const LoadingButton();
              } else {
                if (state is HomeViewSuccessState) {
                  return PostList(posts: state.posts);
                } else {
                  return const SliverToBoxAdapter();
                }
              }
            },
          )
        ],
      ),
    );
  }
}

/*
            buildWhen: (HomeViewState oldState, HomeViewState newState) {
              if (oldState is HomeViewSuccessState && newState is HomeViewLoadingState) {
                if (bloc.isFirst == true) {
                  return true;
                } else {
                  return false;
                }
              }
              return true;
            }
 */
