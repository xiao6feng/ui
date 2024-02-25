import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class TextAnimation extends StatelessWidget {
  const TextAnimation({Key? key, required this.status}) : super(key: key);

  final String status;
  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        fontSize: 15,
        color: Colors.white,
        height: 1.1,
        fontWeight: FontWeight.w400,
      ),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('$status'),
        ],
        isRepeatingAnimation: true,
        repeatForever: true,
      ),
    );
  }
}
