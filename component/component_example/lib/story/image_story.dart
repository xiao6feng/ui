import 'package:flutter/material.dart'
    hide ButtonTheme, AppBar, BackButton, Image;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story imageStory = Story(
  name: 'Widgets/Image',
  builder: (context) => MaterialApp(
    title: 'Storybook Flutter',
    theme: ThemeData(
        extensions: AppTheme.themes, scaffoldBackgroundColor: Colors.black),
    home: Scaffold(
      appBar: const AppBar(
        title: Text('Image'),
      ),
      body: Column(
        children: [
          Image.network(
              'https://merchant-manager-image.oss-cn-hongkong.aliyuncs.com/test/886958355676618833.jpg'),
          Image.auto(
              'https://merchant-manager-image.oss-cn-hongkong.aliyuncs.com/test/886958355676618833.jpg'),
        ],
      ),
    ),
  ),
);
