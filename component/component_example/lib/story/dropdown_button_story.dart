import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final ValueNotifier<String> _sel = ValueNotifier<String>('AA');

final Story dropdownButtonStory = Story(
  name: 'Widgets/dropdown_button',
  builder: (context) => MaterialApp(
    theme: ThemeData(
      extensions: AppTheme.themes,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
    ),
    home: Scaffold(
      backgroundColor: const Color(0xff151E25),
      appBar: AppBar(
        title: Text('dropdown_button'),
      ),
      body: Column(
        children: [
          OvalTextField(
            hintText: 'hint text',
            prefixIcon: ObDropdownButton<String>(
              items: getItems(),
              hint: ValueListenableBuilder<String>(
                builder: (context, value, child) {
                  return Container(
                    height: 48,
                    width: 48,
                    alignment: Alignment.center,
                    child: Text(
                      _sel.value,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  );
                },
                valueListenable: _sel,
              ),
              onChanged: (value) {
                print(value);
                if (value != null) {
                  _sel.value = value;
                }
              },
            ),
            prefixIconConstraints:
                const BoxConstraints(minHeight: 48, minWidth: 48),
          ),
        ],
      ),
    ),
  ),
);
getItems() {
  var items = <DropdownMenuItem<String>>[];
  items.add(DropdownMenuItem(child: Text("AA"), value: "AA"));
  items.add(DropdownMenuItem(
    child: Text("BB"),
    value: "BB",
    alignment: AlignmentDirectional.centerStart,
  ));
  items.add(DropdownMenuItem(
    child: Text("CC"),
    value: "CC",
  ));
  items.add(DropdownMenuItem(
    child: Text("DD"),
    value: "DD",
  ));
  items.add(DropdownMenuItem(
    child: Text("EE"),
    value: "EE",
  ));
  return items;
}
