import 'package:flutter/material.dart' hide ButtonTheme, AppBar, BackButton;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story callCodeStory = Story(
  name: 'Widgets/calling code',
  builder: (context) => MaterialApp(
    theme: ThemeData(
        extensions: AppTheme.themes, scaffoldBackgroundColor: Colors.black),
    home: Scaffold(
        appBar: const AppBar(
          title: Text('calling code'),
        ),
        body: CallingCodeSelect(
          cancelText: '取消',
          titleText: '标题',
          uiCallingCode: List.generate(
              10,
              (index) => UiCallingCode(
                  id: '$index',
                  code: 'code',
                  name: 'name:$index',
                  lenLimits: [100])),
        )),
  ),
);
