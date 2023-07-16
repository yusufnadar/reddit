import 'package:flutter/material.dart';
import '../../../../../core/exports/constants_exports.dart';
import '../../../model/post_model.dart';
import 'post_description.dart';
import 'post_thumbnail.dart';
import 'post_title.dart';

class PostItem extends StatelessWidget {
  final ChildData post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.04,
        vertical: context.height * 0.02,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostThumbnail(thumbnail: post.thumbnail),
          PostTitle(title: post.title),
          PostDescription(description: post.description),
          Container(
            padding: EdgeInsets.only(top: context.height * 0.02),
            alignment: Alignment.bottomRight,
            child: Text(
              post.subreddit ?? 'Unknown',
              style: TextStyleConstants.mediumStyle(
                fontSize: 14,
                color: ColorConstants.red,
              ),
            ),
          )
        ],
      ),
    );
  }
}
