import 'package:flutter/material.dart' hide ButtonTheme, Badge;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story badgeStory = Story(
  name: 'Widgets/badge',
  builder: (context) => MaterialApp(
    theme: ThemeData(
      extensions: AppTheme.themes,
    ),
    home: Scaffold(
      body: Center(
        child: Badge(
          // count: 1,
          overflowCount: 99,
          color: const Color(0xffFF5722),
          dot: true,
          showZero: true,
          child: Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
          ),
        ),
      ),
    ),
  ),
);
