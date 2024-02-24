import 'package:flutter/material.dart' hide ButtonTheme, AppBar, BackButton;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story buttonStory = Story(
  name: 'Widgets/button',
  builder: (context) => MaterialApp(
    title: 'Storybook Flutter',
    theme: ThemeData(
        extensions: AppTheme.themes, scaffoldBackgroundColor: Colors.black),
    home: Scaffold(
      appBar: AppBar(
        title: Text('button'),
      ),
      body: Column(
        children: [
          PrimaryButton(child: Text('Button')),
          BackButton(onPressed: () {}),
          LoadingButton(
            block: true,
            size: ButtonSize.large,
            disabled: true,
            loadingStatus: true,
            child: Text(
              'submit',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    ),
  ),
);
