import 'package:flutter/material.dart' hide ButtonTheme, AlertDialog;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story dialogStory = Story(
  name: 'Widgets/dialog',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
        extensions: AppTheme.themes,
      ),
      home: child,
    );
  },
  builder: (context) => Scaffold(
    body: Center(
      child: PrimaryButton(
        child: Text('show'),
        onPressed: () {
          _show(context);
        },
      ),
    ),
  ),
);

_show(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: 'title',
          content: 'sjaidjaisdajidaj',
          confirmText: 'confirm',
          cancelText: 'cancel',
          onCancelListener: () {},
          onConfirmListener: () {},
        );
      });
}
