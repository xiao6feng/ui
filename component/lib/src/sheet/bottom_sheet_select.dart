import 'package:flutter/material.dart';

class BottomSheetSelect extends StatelessWidget {
  final Widget? title;
  final Widget body;
  final Widget? footer;

  const BottomSheetSelect({
    Key? key,
    this.title,
    required this.body,
    this.footer,
  }) : super(key: key);

  BottomSheetSelect.list({
    required String title,
    required List<Widget> children,
    VoidCallback? onCancelListener,
    double? titleFontSize,
    double? cancelFontSize,
    this.footer,
  })  : title = Container(),
        body = Column(
          children: children,
        );

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        if (title != null) title!,
        body,
        if (footer != null) footer!,
      ],
    );
  }
}