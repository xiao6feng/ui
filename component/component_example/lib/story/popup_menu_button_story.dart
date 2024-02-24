import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final ValueNotifier<String> _sel = ValueNotifier<String>('设置');

final Story popupMenuButtonStory = Story(
  name: 'Widgets/popup_menu_button',
  builder: (context) => MaterialApp(
    theme: ThemeData(
      extensions: AppTheme.themes,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    home: Scaffold(
      backgroundColor: const Color(0xff151E25),
      appBar: AppBar(
        title: Text('popup_menu_button'),
      ),
      body: Column(
        children: [
          OvalTextField(
            hintText: 'hint text',
            prefixIcon: ObPopupMenuButton(
              constraints: const BoxConstraints(minWidth: 100, maxHeight: 300),
              padding: const EdgeInsets.only(top: 100, bottom: 100),
              itemBuilder: (BuildContext context) {
                return const <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: "分享",
                    height: 40,
                    child: Text(
                      '分享',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  PopupMenuItem<String>(
                    value: "设置",
                    height: 40,
                    child: Text(
                      '设置',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                _sel.value = value;
              },
              offset: const Offset(0, 48),
              child: ValueListenableBuilder<String>(
                builder: (context, value, child) {
                  return Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    child: Icon(Icons.arrow_drop_down),
                  );
                },
                valueListenable: _sel,
              ),
            ),
            prefixIconConstraints:
                const BoxConstraints(minHeight: 48, minWidth: 48),
          ),
        ],
      ),
    ),
  ),
);
