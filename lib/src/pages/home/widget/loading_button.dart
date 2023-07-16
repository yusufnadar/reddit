import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import '../../../core/exports/constants_exports.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Container(
          margin: EdgeInsets.only(top: context.height * 0.1),
          decoration: BoxDecoration(
            color: ColorConstants.green,
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.06,
            vertical: context.height * 0.02,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TypewriterAnimatedText(
                'Loading...',
                textStyle: TextStyleConstants.boldStyle(
                  fontSize: 20,
                  color: ColorConstants.white,
                ),
                speed: const Duration(milliseconds: 200),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
