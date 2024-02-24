import 'package:component/gen/assets.gen.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieLoading extends StatelessWidget {
  const LottieLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Lottie.asset(
          Assets.lottie.loading,
          package: 'component',
          width: 72,
          height: 72,
          repeat: true,
        ),
      ],
    );
  }
}
