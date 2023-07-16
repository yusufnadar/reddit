import 'package:flutter/material.dart';
import '../../model/post_model.dart';
import 'postItem/post_item.dart';

class PostList extends StatelessWidget {
  final List<Child> posts;

  const PostList({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: posts.length,
        (context, index) => PostItem(post: posts[index].data),
      ),
    );
  }
}
