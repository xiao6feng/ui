import 'package:flutter/material.dart' hide ButtonTheme, AppBar;
import 'package:storybook_flutter/storybook_flutter.dart';
import 'package:component/component.dart';
import 'package:theme/theme.dart';

final Story toastStory = Story(
  name: 'Widgets/toast',
  wrapperBuilder: (context, child) {
    return MaterialApp(
      builder: ToastManager.init(),
      theme: ThemeData(extensions: AppTheme.themes, useMaterial3: true),
      navigatorObservers: [ToastObserver()],
      home: child,
    );
  },
  builder: (context) => Scaffold(
    body: Column(
      children: [
        PrimaryButton(
          onPressed: () {
            ToastManager().showGifLoading(status: '1');
          },
          child: const Text('gif_loading'),
        ),
        PrimaryButton(
          onPressed: () {
            ToastManager().showLottieLoading(status: '1');
          },
          child: const Text('lottie_loading'),
        ),
      ],
    ),
  ),
);
