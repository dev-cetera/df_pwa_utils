//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Dart/Flutter (DF) Packages by dev-cetera.com & contributors. The use of this
// source code is governed by an MIT-style license described in the LICENSE
// file located in this project's root directory.
//
// See: https://opensource.org/license/mit
//
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//.title~

// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'dart:async' show StreamSubscription;
import 'package:web/web.dart' as web;
import 'package:flutter_web_plugins/flutter_web_plugins.dart' show urlStrategy;

import '_platform_navigator_base.dart';
export '_non_web.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class WebNavigator implements PlatformNavigatorBase {
  static final i = WebNavigator._();
  WebNavigator._();
  factory WebNavigator() {
    return i;
  }

  final _callbacks = <PopStateCallback>[];

  StreamSubscription<web.PopStateEvent>? _subscription;

  @pragma('vm:prefer-inline')
  @override
  Uri? getCurrentUrl() {
    return Uri.tryParse(web.window.location.href);
  }

  @pragma('vm:prefer-inline')
  @override
  void pushState(Uri state) {
    final fullPath = urlStrategy?.prepareExternalUrl(state.pathAndQuery) ?? state.pathAndQuery;
    web.window.history.pushState(null, '', fullPath);
  }

  @pragma('vm:prefer-inline')
  @override
  void replaceState(Uri state) {
    final fullPath = urlStrategy?.prepareExternalUrl(state.pathAndQuery) ?? state.pathAndQuery;
    web.window.history.replaceState(null, '', fullPath);
  }

  @override
  void addStateCallback(PopStateCallback callback) {
    _callbacks.add(callback);
    _subscription ??= web.window.onPopState.listen((event) {
      for (final cb in _callbacks) {
        final currentUrl = getCurrentUrl()!;
        final fullPath =
            urlStrategy?.prepareExternalUrl(currentUrl.pathAndQuery) ?? currentUrl.pathAndQuery;
        web.window.history.replaceState(null, '', fullPath);
        cb(currentUrl);
      }
    });
  }

  @override
  bool removeStateCallback(PopStateCallback callback) {
    final success = _callbacks.remove(callback);
    if (success && _callbacks.isEmpty) {
      final temp = _subscription;
      _subscription = null;
      temp?.cancel();
    }
    return success;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

PlatformNavigatorBase get platformNavigator => WebNavigator();
