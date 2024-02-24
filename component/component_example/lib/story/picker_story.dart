import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story pickerStory = Story(
  name: 'Widgets/picker',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
        extensions: AppTheme.themes,
      ),
      home: child,
    );
  },
  builder: (context) => Scaffold(
    appBar: const AppBar(
      title: Text('picker'),
    ),
    body: Column(
      children: [
        TextButton(
          child: Text('address picker'),
          onPressed: () {
            _showAddress(context);
          },
        ),
        TextButton(
          child: Text('date picker'),
          onPressed: () {
            _showDate(context);
          },
        ),
        TextButton(
          child: Text('date range picker'),
          onPressed: () {
            _showDateRange(context);
          },
        ),
      ],
    ),
  ),
);

_showAddress(BuildContext context) async {
  final result = await showAddressPicker(context: context);
  print('${result?.cityName}');
}

_showDate(BuildContext context) async {
  final result = await showObDatePicker(context: context);
  print('${result.toString()}');
}

_showDateRange(BuildContext context) async {
  final result = await showObDateRangePicker(context: context);
  print('${result.toString()}');
}
