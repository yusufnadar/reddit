import 'package:flutter/material.dart';
import '../../../../../core/exports/constants_exports.dart';

class PostThumbnail extends StatelessWidget {
  final String? thumbnail;

  const PostThumbnail({Key? key, required this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(
      thumbnail!,
      width: context.width,
      height: context.height * 0.2,
      fit: BoxFit.cover,
      errorBuilder:
          (BuildContext context, Object exception, StackTrace? stackTrace) {
        return Image.network(AppConstants.defaultImage);
      },
    );
  }
}
