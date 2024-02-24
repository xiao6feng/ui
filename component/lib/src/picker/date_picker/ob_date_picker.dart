import 'package:flutter/cupertino.dart'
    hide CupertinoDatePicker, CupertinoDatePickerMode;
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../picker_selection_overlay.dart';
import '../picker_title.dart';
import 'date_picker.dart';

///
class ObDatePicker extends StatefulWidget {
  ///
  const ObDatePicker({
    Key? key,
    this.onCancelListener,
    this.onConfirmListener,
    this.initialDateTime,
    this.minimumDate,
    this.maximumDate,
    this.backgroundColor,
    this.itemExtent,
    this.datePickerPadSize,
    this.magnification,
    this.cancelText,
    this.confirmText,
    this.isPickerColumnOnlyCenter = false,
  }) : super(key: key);

  ///
  final VoidCallback? onCancelListener;

  ///
  final ValueChanged<DateTime>? onConfirmListener;

  ///
  final DateTime? initialDateTime;

  ///
  final DateTime? minimumDate;

  ///
  final DateTime? maximumDate;

  final bool isPickerColumnOnlyCenter;

  final Color? backgroundColor;

  final double? itemExtent;

  final double? datePickerPadSize;

  final double? magnification;

  final String? cancelText;
  final String? confirmText;

  @override
  _ObDatePickerState createState() => _ObDatePickerState();
}

class _ObDatePickerState extends State<ObDatePicker> {
  DateTime time = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PickerTitle(
          onCancelListener: Navigator.of(context).pop,
          onConfirmListener: () => Navigator.of(context).pop(time),
          cancelText: widget.cancelText,
          confirmText: widget.confirmText,
        ),
        Expanded(
          child: CupertinoDatePicker(
            selectionOverlay: const PickerSelectionOverlay(),
            mode: CupertinoDatePickerMode.date,
            itemExtent: widget.itemExtent,
            backgroundColor: widget.backgroundColor,
            datePickerPadSize: widget.datePickerPadSize,
            magnification: widget.magnification,
            initialDateTime: widget.initialDateTime,
            minimumDate: widget.minimumDate,
            maximumDate: widget.maximumDate,
            isPickerColumnOnlyCenter: widget.isPickerColumnOnlyCenter,
            onDateTimeChanged: (DateTime value) {
              setState(() {
                time = value;
                Vibrate.feedback(FeedbackType.impact);
              });
            },
          ),
        ),
      ],
    );
  }
}
