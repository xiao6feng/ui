import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story listTileStory = Story(
  name: 'Widgets/list_tile',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
        extensions: AppTheme.themes,
        useMaterial3: false,
        scaffoldBackgroundColor: Color(0xff151E25),
      ),
      home: child,
    );
  },
  builder: (context) => Scaffold(
      appBar: const AppBar(
        title: Text('list_tile'),
      ),
      body: ListView(
        children: [
          ObListTile(
            leading: const Icon(
              Icons.people,
              color: Colors.white,
              size: 40,
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Title'),
                Text(
                  '+50',
                  style: TextStyle(
                      color: Color(0xff69E300),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            subtitle: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtitle',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  '¥ 4,500.00',
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            tileColor: Colors.white.withOpacity(0.04),
          ),
          ObListTile(
            leading: const Icon(
              Icons.abc,
              color: Colors.white,
              size: 40,
            ),
            title: const Text('Title'),
            tileColor: Colors.white.withOpacity(0.4),
            trailing: const Text('trailing'),
          ),
          ObListTile(
            title: const Text('Title'),
            tileColor: Colors.black.withOpacity(0.9),
          ),
        ],
      )),
);
