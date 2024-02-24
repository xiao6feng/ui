import 'package:flutter/material.dart' hide TextTheme;
import 'package:theme/theme.dart';

import 'calling_code.dart';
import 'calling_code_tile.dart';

class CallingCodeSelect extends StatelessWidget {
  final List<UiCallingCode> uiCallingCode;
  final String? selectId;
  final ValueChanged<String?>? onAreaCodeChoose;
  final VoidCallback? onBack;
  final String? cancelText;
  final String? titleText;

  const CallingCodeSelect({
    Key? key,
    this.uiCallingCode = const [],
    this.selectId,
    this.onAreaCodeChoose,
    this.onBack,
    this.cancelText,
    this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).extension<AppTheme>()?.textTheme;

    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 44,
          // padding: EdgeInsets.symmetric(horizontal: 16.w),
          color: Colors.white.withOpacity(0.04),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: onBack,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    child: Text(
                      cancelText ?? 'cancel',
                      style: textTheme?.subtitleStyle ??
                          TextStyle(color: Colors.white.withOpacity(0.6)),
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  titleText ?? 'choose_calling_code_label',
                  style: textTheme?.titleStyle ??
                      TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: ListView(
          children: uiCallingCode
              .map((b) => GestureDetector(
                    onTap: () {
                      onAreaCodeChoose?.call(b.id);
                    },
                    child: CallingCodeTile(
                      uiCallingCode: b,
                      selected: selectId == b.id,
                    ),
                  ))
              .toList(),
        ))
      ],
    );
  }
}
