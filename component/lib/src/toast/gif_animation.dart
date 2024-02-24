import 'package:component/gen/assets.gen.dart';
import 'package:flutter/widgets.dart';

///
class GifAnimation extends StatelessWidget {
  ///
  const GifAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      Assets.gif.anigif.path,
      fit: BoxFit.fitWidth,
      gaplessPlayback: true,
      width: 50,
      package: 'component',
    );
  }
}
