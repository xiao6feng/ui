import 'package:flutter/material.dart' hide ButtonTheme, AppBar, SearchBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final _editC = TextEditingController();
final focusNode = FocusNode();
final Story appSearchBarStory = Story(
  name: 'Widgets/app_search_bar',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
        extensions: AppTheme.themes,
      ),
      home: child,
    );
  },
  builder: (context) => Scaffold(
      appBar: AppBar(
    title: SearchBar(
      editingController: _editC,
      focusNode: focusNode,
      onChanged: (value) {},
      onSubmitted: (value) {
        print('onSubmitted');
        focusNode.unfocus();
      },
    ),
  )),
);
