import 'package:flutter/material.dart';
import '../../../../../core/exports/constants_exports.dart';

class PostTitle extends StatelessWidget {
  final String? title;

  const PostTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.height * 0.02,
        bottom: context.height * 0.01,
      ),
      child: Text(
        title ?? '',
        style: TextStyleConstants.regularStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
