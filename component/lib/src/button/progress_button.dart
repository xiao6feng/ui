import 'package:component/src/button/button_size.dart';
import 'package:component/src/button/primary_button.dart';
import 'package:flutter/material.dart';

///
typedef ProgressWidgetBuilder = Widget Function(
    BuildContext context, double progress);

///
class ProgressButton extends StatelessWidget {
  ///
  const ProgressButton({
    required this.progress,
    required this.builder,
    Key? key,
  }) : super(key: key);

  /// 进度
  final double progress;

  ///
  final ProgressWidgetBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
            child: PrimaryButton(
          block: true,
          size: ButtonSize.large,
          child: builder(context, progress),
        )),
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const ShapeDecoration(
            shape: StadiumBorder(),
          ),
          child: LinearProgressIndicator(
            value: progress >= 1 ? 0 : progress,
            minHeight: 40,
            backgroundColor: Colors.transparent,
            valueColor: const AlwaysStoppedAnimation(Colors.white38),
          ),
        ),
      ],
    );
  }
}
