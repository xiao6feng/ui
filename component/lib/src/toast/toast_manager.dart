import 'package:bot_toast/bot_toast.dart';
import 'package:component/src/toast/lottie_loading.dart';
import 'package:flutter/material.dart';
import 'package:theme/theme.dart';

import 'gif_animation.dart';
import 'text_animation.dart';

const Decoration _kLoadingDecoration = BoxDecoration(
  color: Color(0xCC000000),
  borderRadius: BorderRadius.all(Radius.circular(8)),
  border: Border.fromBorderSide(BorderSide(color: Color(0x51FFFFFF), width: 1)),
);

const Decoration _kTextDecoration = ShapeDecoration(
  shape: StadiumBorder(side: BorderSide(color: Color(0x33ffffff), width: 1)),
  color: Color(0x66000000),
);

const Decoration _kSuccessDecoration = BoxDecoration(
  color: Color(0xCC000000),
  borderRadius: BorderRadius.all(Radius.circular(8)),
  border: Border.fromBorderSide(BorderSide(color: Color(0x33ffffff), width: 1)),
);

const Decoration _kErrorDecoration = BoxDecoration(
  color: Color(0xCC000000),
  borderRadius: BorderRadius.all(Radius.circular(8)),
  border: Border.fromBorderSide(BorderSide(color: Color(0x33ffffff), width: 1)),
);

///
typedef CancelFunc = void Function();

/// toast 管理器
class ToastManager {
  ToastManager._internal();

  static final ToastManager _singleton = ToastManager._internal();

  factory ToastManager() {
    return _singleton;
  }

  /// 初始化
  static TransitionBuilder init() {
    return BotToastInit();
  }

  /// 初始化
  static TransitionBuilder initWithParameters({TransitionBuilder? builder}) {
    final TransitionBuilder toastBuilder = BotToastInit();
    if (builder == null) return toastBuilder;
    return (BuildContext context, Widget? child) {
      return toastBuilder(context, builder(context, child));
    };
  }

  ///
  void dismissAll() {
    BotToast.cleanAll();
  }

  ///
  void dismissLoading() {
    BotToast.closeAllLoading();
  }

  @Deprecated('Use [showGifLoading]')
  CancelFunc showLoading({String? status}) {
    return showGifLoading(status: status);
  }

  /// loading 对话框
  CancelFunc showGifLoading({String? status}) {
    return BotToast.showCustomLoading(
        backgroundColor: Colors.transparent,
        toastBuilder: (_) {
          return Builder(builder: (context) {
            final theme = Theme.of(context).extension<AppTheme>()?.toastTheme;
            return Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12,
              ),
              decoration: theme?.loadingDecoration ?? _kLoadingDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const GifAnimation(),
                  if (status != null)
                    Column(
                      children: <Widget>[
                        const SizedBox(height: 8),
                        Text(
                          status,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            height: 1.1,
                            fontWeight: FontWeight.w400,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ],
                    )
                ],
              ),
            );
          });
        });
  }

  /// loading 对话框
  CancelFunc showTextLoading({String status = 'Loading...'}) {
    return BotToast.showCustomLoading(
        backgroundColor: Colors.transparent,
        toastBuilder: (_) {
          return Builder(builder: (context) {
            final theme = Theme.of(context).extension<AppTheme>()?.toastTheme;
            return Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12,
              ),
              decoration: theme?.loadingDecoration ?? _kLoadingDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextAnimation(status: status),
                ],
              ),
            );
          });
        });
  }

  /// lottie loading 对话框
  CancelFunc showLottieLoading({String? status}) {
    return BotToast.showCustomLoading(
        clickClose: false,
        allowClick: false,
        ignoreContentClick: true,
        backgroundColor: Colors.transparent,
        toastBuilder: (_) {
          return Builder(builder: (context) {
            //final theme = Theme.of(context).extension<AppTheme>()?.toastTheme;
            return LottieLoading();
          });
        });
  }

  ///
  CancelFunc showText(String message) {
    BotToast.removeAll(BotToast.textKey);
    return BotToast.showCustomText(
        onlyOne: true,
        duration: const Duration(seconds: 2),
        align: Alignment.center,
        wrapAnimation: null,
        wrapToastAnimation: null,
        toastBuilder: (_) {
          return Builder(builder: (context) {
            final theme = Theme.of(context).extension<AppTheme>()?.toastTheme;
            return Container(
              margin: const EdgeInsets.all(30),
              decoration: theme?.textDecoration ?? _kTextDecoration,
              constraints: const BoxConstraints(
                minWidth: 96,
              ),
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 4),
              child: Text(
                message,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.1),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            );
          });
        });
  }

  ///
  CancelFunc showSuccess({required String message}) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        animationDuration: const Duration(milliseconds: 300),
        groupKey: BotToast.loadKey,
        onlyOne: true,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
        toastBuilder: (_) {
          return Builder(builder: (context) {
            final theme = Theme.of(context).extension<AppTheme>()?.toastTheme;
            return Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12,
              ),
              decoration: theme?.successDecoration ?? _kSuccessDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 40,
                  ),
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text(
                        message,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1.1),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ],
                  )
                ],
              ),
            );
          });
        });
  }

  ///
  CancelFunc showError({required String message}) {
    const Alignment align = Alignment.center;
    return BotToast.showAnimationWidget(
        wrapToastAnimation:
            (AnimationController controller, Function cancel, Widget child) {
          child = Align(alignment: align, child: child);
          return SafeArea(child: child);
        },
        animationDuration: const Duration(milliseconds: 300),
        groupKey: BotToast.loadKey,
        onlyOne: true,
        backgroundColor: Colors.transparent,
        duration: const Duration(seconds: 2),
        toastBuilder: (_) {
          return Builder(builder: (context) {
            final theme = Theme.of(context).extension<AppTheme>()?.toastTheme;
            return Container(
              width: 96,
              height: 96,
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 12,
              ),
              decoration: theme?.errorDecoration ?? _kErrorDecoration,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(
                    Icons.clear,
                    color: Colors.white,
                    size: 40,
                  ),
                  Column(
                    children: <Widget>[
                      const SizedBox(height: 8),
                      Text(
                        message,
                        style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 1.1),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ],
                  )
                ],
              ),
            );
          });
        });
  }
}

/// 二次封装
class ToastObserver extends BotToastNavigatorObserver {}
