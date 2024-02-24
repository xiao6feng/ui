// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class IndexController extends ChangeNotifier {
  // ignore: constant_identifier_names
  static const int NEXT = 1;

  // ignore: constant_identifier_names
  static const int PREVIOUS = -1;

  // ignore: constant_identifier_names
  static const int MOVE = 0;

  late Completer<void> _completer;

  int index = 0;
  bool animation = false;
  int event = 0;

  Future<void> move(int index, {bool animation = true}) {
    this.animation = animation;
    this.index = index;
    event = MOVE;
    _completer = Completer();
    notifyListeners();
    return _completer.future;
  }

  Future<void> next({bool animation = true}) {
    event = NEXT;
    this.animation = animation;
    _completer = Completer();
    notifyListeners();
    return _completer.future;
  }

  Future<void> previous({bool animation = true}) {
    event = PREVIOUS;
    this.animation = animation;
    _completer = Completer();
    notifyListeners();
    return _completer.future;
  }

  void complete() {
    if (!_completer.isCompleted) {
      _completer.complete();
    }
  }
}
