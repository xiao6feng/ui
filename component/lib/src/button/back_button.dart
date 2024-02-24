import 'package:component/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BackButton extends StatelessWidget {
  const BackButton({
    Key? key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onPressed != null) {
          onPressed!.call();
        } else {
          Navigator.maybePop(context);
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Image.asset(
          Assets.images.icon.comBack.path,
          width: 24,
          height: 24,
          package: 'component',
        ),
      ),
    );
  }
}
