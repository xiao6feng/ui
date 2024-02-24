import 'package:flutter/material.dart' hide ButtonTheme;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final ValueNotifier<bool> _sel = ValueNotifier<bool>(true);

final Story radioStory = Story(
  name: 'Widgets/radio',
  builder: (context) => MaterialApp(
    title: 'Storybook Flutter',
    theme: ThemeData(
      extensions: AppTheme.themes,
    ),
    home: Scaffold(
      body: Center(
        child: ValueListenableBuilder<bool>(
          builder: (context, value, child) {
            return ObRadio(
              value: _sel.value,
              onChange: (bool value) {
                print("onRadioChangeListener---->$value");
                _sel.value = value;
              },
            );
          },
          valueListenable: _sel,
        ),
      ),
    ),
  ),
);
