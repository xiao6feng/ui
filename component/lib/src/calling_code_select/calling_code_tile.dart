import 'package:component/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'calling_code.dart';

class CallingCodeTile extends StatelessWidget {
  final UiCallingCode uiCallingCode;
  final bool selected;

  const CallingCodeTile(
      {Key? key, this.selected = false, required this.uiCallingCode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      height: 48,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.06),
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              uiCallingCode.name ?? '',
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 14,
              ),
            ),
          ),
          AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: selected ? 1 : 0,
            child: Image.asset(
              Assets.images.icon.comSelect.path,
              width: 24,
              height: 24,
              package: 'component',
            ),
          )
        ],
      ),
    );
  }
}
