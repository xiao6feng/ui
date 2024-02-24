import 'package:component/component.dart';
import 'package:component/src/popup_window/window.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

typedef ValueDodo<T, E> = T Function(E value);

extension ExtensionChip on GetInterface {

  Future<T?> showFilter<T>({
    required BuildContext context,
    required GlobalKey positionKey,
    required Widget? child,
    VoidCallback? onWindowDismiss,
  }) {
    return showWindow<T>(
      context: context,
      position: _positionForFilters(
        globalKey: positionKey,
      ),
      onWindowDismiss: onWindowDismiss,
      windowBuilder: (ctx, anim, secondAnim) => FadeTransition(
        opacity: anim,
        child: child,
      ),
    );
  }

  static RelativeRect _positionForFilters({required GlobalKey globalKey}) {
    final currentObj = globalKey.currentContext?.findRenderObject();
    final overlayObj = Get.overlayContext?.findRenderObject();
    if (currentObj == null || overlayObj == null) {
      return const RelativeRect.fromLTRB(0, 0, 0, 0);
    }
    final filterObj = currentObj as RenderBox;
    final overlay = overlayObj as RenderBox;
    final objSize = currentObj.size;
    RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        filterObj.localToGlobal(Offset.zero, ancestor: overlay),
        filterObj.localToGlobal(Offset.zero, ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    position = RelativeRect.fromLTRB(
      position.left,
      position.top + objSize.height,
      position.right,
      position.bottom,
    );
    return position;
  }


}
