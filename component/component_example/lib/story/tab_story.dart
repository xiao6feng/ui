import 'package:flutter/material.dart' hide ButtonTheme;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/colors.dart';
import 'package:theme/theme.dart';

final Story tabStory = Story(
  name: 'Widgets/tab',
  builder: (context) => MaterialApp(
    theme: ThemeData(
      extensions: AppTheme.themes,
    ),
    home: const Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: DefaultTabController(
          length: 3,
          child: PreferredSize(
            preferredSize: Size.fromHeight(44),
            child: ObTabBar(
              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              unselectedLabelStyle:
                  TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              tabs: <Widget>[
                SizedBox(
                  height: 44,
                  child: const Center(child: Text('今日')),
                ),
                SizedBox(
                  height: 44,
                  child: const Center(child: Text('昨日')),
                ),
                SizedBox(
                  height: 44,
                  child: const Center(child: Text('近七日')),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  ),
);
