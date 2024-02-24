import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide TextTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';
import 'package:theme/colors.dart';

final Story tableStory = Story(
  name: 'Widgets/table',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      theme: ThemeData(
        extensions: AppTheme.themes,
      ),
      home: child,
    );
  },
  builder: (context) => _home(context),
);

Widget _home(BuildContext context) {
  final TextTheme? theme = Theme.of(context).extension<AppTheme>()?.textTheme;
  return Scaffold(
    appBar: const AppBar(
      title: Text('Ob Table'),
    ),
    backgroundColor: AppColors.backgroundColor,
    body: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            'Default Style',
            style: theme?.titleStyle,
          ),
          const ObTable(
            tableData: [
              ['column0 row0', 'column0 row1', 'column0 row2', 'column0 row3'],
              ['column1 row0', 'column1 row1', 'column1 row2', 'column0 row3'],
              ['column2 row0', 'column2 row1', 'column2 row2', 'column0 row3'],
              ['column3 row0', 'column3 row1', 'column3 row2', 'column0 row3'],
            ],
            columnExtent: FractionalTableSpanExtent(0.25),
          ),
          Text(
            'Custom Style',
            style: theme?.titleStyle,
          ),
          ObTable(
            pinnedColumnCount: 0,
            dragStartBehavior: DragStartBehavior.down,
            tableData: const [
              ['column0 row0', 'column0 row1', 'column0 row2', 'column0 row3'],
              ['column1 row0', 'column1 row1', 'column1 row2', 'column0 row3'],
              ['column2 row0', 'column2 row1', 'column2 row2', 'column0 row3'],
              ['column3 row0', 'column3 row1', 'column3 row2', 'column0 row3'],
            ],
            cellBuilder: (context, vicinity) {
              return Center(
                child: Text(
                  '${vicinity.column}:${vicinity.row}',
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                  textAlign: TextAlign.center,
                ),
              );
            },
            columnBuilder: (index) {
              return TableSpan(
                backgroundDecoration: TableSpanDecoration(
                  color: index.isEven ? null : const Color(0x1aE1A100),
                ),
                extent: const FixedTableSpanExtent(130),
              );
            },
            rowBuilder: (index) {
              return TableSpan(
                backgroundDecoration: TableSpanDecoration(
                  color: index.isEven ? null : const Color(0x0aFFFFFF),
                ),
                extent: const FixedTableSpanExtent(40),
              );
            },
          ),
        ],
      ),
    ),
  );
}
