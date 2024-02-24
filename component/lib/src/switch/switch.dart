import 'package:flutter/material.dart' hide SwitchTheme;
import 'package:theme/theme.dart';

const double _kSwitchWidth = 40.0;
const double _kSwitchHeight = 24.0;
const double _kSwitchBorder = 3.0;

///
final Color _kSwitchBgColor = Colors.white.withOpacity(0.1);
const Color _kSwitchBgColorOn = Color(0x1AFF5722);

///
final Color _kSwitchBorderColor = Colors.white.withOpacity(0.6);
final Color _kSwitchBorderColorOn = const Color(0xffFF5722).withOpacity(0.6);

///
const Color _kSwitchDotColor = Colors.white;
const Color _kSwitchDotColorOn1 = Color(0xffFF9047);
const Color _kSwitchDotColorOn2 = Color(0xffFF5722);

///
const Duration _switchDuration = Duration(milliseconds: 200);

///
class ObSwitch extends StatelessWidget {
  ///
  const ObSwitch({
    this.value = false,
    this.onChanged,
  });

  ///
  final bool value;

  ///
  final ValueChanged<bool>? onChanged;

  @override
  Widget build(BuildContext context) {
    final SwitchTheme? switchTheme =
        Theme.of(context).extension<AppTheme>()?.switchTheme;

    bool stateChanged = value;
    final double width = switchTheme?.width ?? _kSwitchWidth;
    final double height = switchTheme?.height ?? _kSwitchHeight;
    final double switchBorder = switchTheme?.border ?? _kSwitchBorder;
    final double circleHeight = height - switchBorder * 2;
    final double startPoint = switchBorder;
    final double endPoint = width - circleHeight - switchBorder;

    final Color switchBgColor = switchTheme?.backgroundColor ?? _kSwitchBgColor;
    final Color switchBgColorOn =
        switchTheme?.backgroundColorOn ?? _kSwitchBgColorOn;

    ///
    final Color switchBorderColor =
        switchTheme?.borderColor ?? _kSwitchBorderColor;
    final Color switchBorderColorOn =
        switchTheme?.borderColorOn ?? _kSwitchBorderColorOn;

    ///
    final Color switchDotColor = switchTheme?.dotColor ?? _kSwitchDotColor;
    final Color switchDotColorOn1 =
        switchTheme?.dotColorOn1 ?? _kSwitchDotColorOn1;
    final Color switchDotColorOn2 =
        switchTheme?.dotColorOn2 ?? _kSwitchDotColorOn2;
    final Duration switchDuration = switchTheme?.duration ?? _switchDuration;

    return GestureDetector(
      onTap: () {
        stateChanged = !stateChanged;
        onChanged?.call(stateChanged);
      },
      child: Stack(
        children: <Widget>[
          Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: stateChanged ? switchBgColorOn : switchBgColor,
                border: Border.all(
                  color: stateChanged ? switchBorderColorOn : switchBorderColor,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(height),
              )),
          Positioned(
              top: height * 0.35,
              right: height * 0.3,
              child: Offstage(
                offstage: stateChanged,
                child: Container(
                  width: 1,
                  height: height * 0.3,
                  color: switchBorderColor,
                ),
              )),
          AnimatedPositioned(
            width: circleHeight,
            height: circleHeight,
            top: switchBorder,
            left: stateChanged ? endPoint : startPoint,
            duration: switchDuration,
            child:
                LayoutBuilder(builder: (BuildContext ctx, BoxConstraints cons) {
              return Container(
                decoration: BoxDecoration(
                  gradient: stateChanged
                      ? LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                              switchDotColorOn1,
                              switchDotColorOn2,
                            ])
                      : LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                              switchDotColor,
                              switchDotColor,
                            ]),
                  shape: BoxShape.circle,
                ),
                width: cons.maxHeight,
                height: cons.maxHeight,
              );
            }),
          ),
        ],
      ),
    );
  }
}
