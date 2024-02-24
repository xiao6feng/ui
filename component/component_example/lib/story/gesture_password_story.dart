import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story gesturePasswordStory = Story(
  name: 'Widgets/gesture_password',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
        extensions: AppTheme.themes,
        scaffoldBackgroundColor: const Color(0xff151E25),
      ),
      home: child,
    );
  },
  builder: (context) => Scaffold(
      appBar: const AppBar(
        title: Text(
          'gesture_password',
        ),
      ),
      body: GesturePasswordWidget()),
);
