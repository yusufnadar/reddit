import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_view_bloc.dart';
import '../bloc/home_view_event.dart';

class HomeRefreshIndicator extends StatelessWidget {
  const HomeRefreshIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<HomeViewBloc>(context);
    return CupertinoSliverRefreshControl(
      onRefresh: () async {
        bloc.add(HomeViewGetPostsEvent());
      },
    );
  }
}
