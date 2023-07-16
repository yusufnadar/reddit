import 'package:flutter/material.dart';
import '../../../../../core/exports/constants_exports.dart';

class PostDescription extends StatelessWidget {
  final String? description;

  const PostDescription({Key? key, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      (description == null || description == '') == true
          ? 'There is no description'
          : description!.substring(0, 40),
      style: TextStyleConstants.regularStyle(
        fontSize: 14,
        color: ColorConstants.grey,
      ),
    );
  }
}
