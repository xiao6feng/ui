import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

/// picker 默认 selectionOverlay
class PickerSelectionOverlay extends StatelessWidget {
  ///
  const PickerSelectionOverlay();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()?.pickerTheme;
    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme?.pickerSelectionOverlayColor ??
            Colors.white.withOpacity(0.04),
        border: theme?.pickerSelectionOverlayBorder ??
            Border(
              top: BorderSide(
                  color: Colors.white.withOpacity(0.06),
                  width: 1,
                  style: BorderStyle.solid),
              bottom: BorderSide(
                  color: Colors.white.withOpacity(0.06),
                  width: 1,
                  style: BorderStyle.solid),
            ),
      ),
    );
  }
}
