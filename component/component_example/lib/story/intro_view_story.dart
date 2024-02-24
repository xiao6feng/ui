import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story introViewStory = Story(
  name: 'Widgets/intro_view',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
        extensions: AppTheme.themes,
        scaffoldBackgroundColor: Color(0xff151E25),
      ),
      home: child,
    );
  },
  builder: (context) => Scaffold(
      appBar: const AppBar(
        title: Text(
          'intro_view',
        ),
      ),
      body: IntroView(
        builder: (context, index) {
          return Container(
            color: index % 2 == 0 ? Colors.blueAccent : Colors.blue,
            child: Center(
              child: Text('$index'),
            ),
          );
        },
        itemCount: 3,
      )),
);
