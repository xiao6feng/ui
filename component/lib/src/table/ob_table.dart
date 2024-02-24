import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

class ObTable extends StatelessWidget {
  const ObTable({
    super.key,
    required this.tableData,
    this.rowHeight = 40,
    this.columnExtent = const FixedTableSpanExtent(100),
    this.columnBuilder,
    this.rowBuilder,
    this.cellBuilder,
    this.verticalDetails = const ScrollableDetails.vertical(),
    this.horizontalDetails = const ScrollableDetails.horizontal(),
    this.mainAxis = Axis.vertical,
    this.cacheExtent,
    this.diagonalDragBehavior = DiagonalDragBehavior.none,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.clipBehavior = Clip.hardEdge,
    this.dragStartBehavior = DragStartBehavior.start,
    this.pinnedRowCount = 0,
    this.pinnedColumnCount = 1,
  });
  // [
  //   ['column0 row0', 'column0 row1', 'column0 row2', 'column0 row3'],
  //   ['column1 row0', 'column1 row1', 'column1 row2', 'column0 row3'],
  //   ['column2 row0', 'column2 row1', 'column2 row2', 'column0 row3'],
  //   ['column3 row0', 'column3 row1', 'column3 row2', 'column0 row3'],
  // ];
  final List<List<String>> tableData;
  final double rowHeight;
  final TableSpanExtent columnExtent;

  final TableSpanBuilder? columnBuilder;
  final TableSpanBuilder? rowBuilder;
  final TableViewCellBuilder? cellBuilder;

  final Axis mainAxis;
  final ScrollableDetails horizontalDetails;
  final ScrollableDetails verticalDetails;
  final double? cacheExtent;
  final DiagonalDragBehavior diagonalDragBehavior;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final Clip clipBehavior;
  final int pinnedRowCount;
  final int pinnedColumnCount;

  @override
  Widget build(BuildContext context) {
    final TableTheme? theme =
        Theme.of(context).extension<AppTheme>()?.tableTheme;

    final rows = tableData.first;
    return SizedBox(
      height: rowHeight * rows.length,
      child: TableView.builder(
        mainAxis: mainAxis,
        horizontalDetails: horizontalDetails,
        verticalDetails: verticalDetails,
        cacheExtent: cacheExtent,
        diagonalDragBehavior: diagonalDragBehavior,
        dragStartBehavior: dragStartBehavior,
        keyboardDismissBehavior: keyboardDismissBehavior,
        clipBehavior: clipBehavior,
        pinnedColumnCount: pinnedColumnCount,
        pinnedRowCount: pinnedRowCount,
        cellBuilder: (context, vicinity) {
          if (cellBuilder != null) {
            return cellBuilder!(context, vicinity);
          }
          return _buildCell(context, vicinity, theme);
        },
        columnCount: tableData.length,
        columnBuilder: (index) {
          if (columnBuilder != null) {
            return columnBuilder!(index);
          }
          return _buildColumnSpan(index, theme);
        },
        rowCount: rows.length,
        rowBuilder: (index) {
          if (rowBuilder != null) {
            return rowBuilder!(index);
          }
          return _buildRowSpan(index, theme);
        },
      ),
    );
  }

  Widget _buildCell(
      BuildContext context, TableVicinity vicinity, TableTheme? theme) {
    TextStyle style = TextStyle(color: Colors.white, fontSize: 14);
    if (theme?.cellTextStyleFunc != null) {
      style = theme!.cellTextStyleFunc(vicinity.column, vicinity.row);
    }
    final text = tableData[vicinity.column][vicinity.row];
    return Center(
      child: Text(
        text,
        style: style,
        textAlign: TextAlign.center,
      ),
    );
  }

  TableSpan _buildColumnSpan(int index, TableTheme? theme) {
    Color? backgrundColor;
    if (theme?.columnColorFunc != null) {
      backgrundColor = theme!.columnColorFunc(index);
    }
    return TableSpan(
      backgroundDecoration: TableSpanDecoration(
        color: backgrundColor,
      ),
      extent: columnExtent,
    );
  }

  TableSpan _buildRowSpan(int index, TableTheme? theme) {
    Color? backgrundColor;
    if (theme?.rowColorFunc != null) {
      backgrundColor = theme!.rowColorFunc(index);
    }

    return TableSpan(
      backgroundDecoration: TableSpanDecoration(
        color: backgrundColor,
      ),
      extent: const FixedTableSpanExtent(40),
    );
  }
}
