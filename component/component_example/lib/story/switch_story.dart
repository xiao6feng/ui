import 'package:flutter/material.dart' hide ButtonTheme;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/colors.dart';
import 'package:theme/theme.dart';

final ValueNotifier<bool> _sel = ValueNotifier<bool>(true);

final Story switchStory = Story(
  name: 'Widgets/switch',
  builder: (context) => MaterialApp(
    theme: ThemeData(
      extensions: AppTheme.themes,
    ),
    home: Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: ValueListenableBuilder<bool>(
          builder: (context, value, child) {
            return ObSwitch(
              value: _sel.value,
              onChanged: (bool value) {
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
