import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story searchTagStory = Story(
  name: 'Widgets/search_tag',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
          extensions: AppTheme.themes,
          useMaterial3: true,
          scaffoldBackgroundColor: Color(0xff151E25)),
      home: child,
    );
  },
  builder: (context) => Scaffold(
      appBar: const AppBar(
        title: Text(
          'search_tag',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchTag(
            title: 'Default Style',
            tags: ['1', '2', '3', '1', '2', '3', '1', '2', '3'],
            onTap: (index) {
              print('value $index');
            },
          ),
          const SizedBox(
            height: 30,
          ),
          const SearchTag(
            title: 'Default config Style',
            tags: ['1', '2', '3', '1', '2', '3', '1', '2', '3'],
            tagPadding: EdgeInsets.all(10),
            titlePadding: EdgeInsets.all(10),
            tagRadius: 20,
            tagBackgroundColor: Colors.red,
          ),
          const SizedBox(
            height: 30,
          ),
          SearchTag(
            titleWidget: const Text(
              'Custom Style',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            tagWidgets: List.generate(
                10,
                (index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      color: Colors.blue,
                      child: Text(
                        '$index',
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    )),
          ),
        ],
      )),
);
