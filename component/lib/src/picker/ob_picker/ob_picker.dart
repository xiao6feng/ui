import 'package:flutter/cupertino.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

import '../picker_selection_overlay.dart';
import '../picker_title.dart';

///
class ObPicker extends StatefulWidget {
  ///
  const ObPicker({
    required this.children,
    Key? key,
  }) : super(key: key);

  ///
  final List<Widget> children;

  @override
  _ObPickerState createState() => _ObPickerState();
}

class _ObPickerState extends State<ObPicker> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        PickerTitle(
          onCancelListener: Navigator.of(context).pop,
          onConfirmListener: () => Navigator.of(context).pop(index),
        ),
        Expanded(
          child: CupertinoPicker(
            itemExtent: 40,
            selectionOverlay: const PickerSelectionOverlay(),
            onSelectedItemChanged: (int index) {
              setState(() {
                Vibrate.feedback(FeedbackType.impact);
                this.index = index;
              });
            },
            children: widget.children,
          ),
        ),
      ],
    );
  }
}
