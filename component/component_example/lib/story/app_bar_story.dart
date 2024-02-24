import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story appBarStory = Story(
  name: 'Widgets/app_bar',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(extensions: AppTheme.themes, useMaterial3: true),
      home: child,
    );
  },
  builder: (context) => Scaffold(
      appBar: AppBar(
        title: Text(
          'nav.title',
        ),
        actions: [Icon(Icons.edit)],
        // leading: Icon(
        //   Icons.navigate_before,
        //   color: Colors.white,
        // ),
      ),
      body: ListView.builder(
        primary: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.red,
              height: 90,
            ),
          );
        },
        itemCount: 100,
      )),
);
