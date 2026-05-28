//.title
// ▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓
//
// Copyright © dev-cetera.com & contributors.
//
// The use of this source code is governed by an MIT-style license described in
// the LICENSE file located in this project's root directory.
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

  @override
  Uri stripBaseHref(Uri url) {
    final baseHref = _getBaseHref();
    if (baseHref == '/') {
      return url;
    }

    final path = url.path;
    // Match only on segment boundaries: baseHref always ends with '/'.
    if (path == baseHref.substring(0, baseHref.length - 1) ||
        path.startsWith(baseHref)) {
      var newPath = path.substring(baseHref.length - 1);
      if (newPath.isEmpty || !newPath.startsWith('/')) {
        newPath = '/$newPath';
      }
      return url.replace(path: newPath);
    }

    return url;
  }

  String _getBaseHref() {
    final baseElement = web.window.document.querySelector('base');
    final raw = baseElement?.getAttribute('href');
    if (raw == null || raw.isEmpty) return '/';
    // Strip scheme/host if `href` is absolute (e.g. "https://x.com/app/").
    var href = raw;
    final parsed = Uri.tryParse(raw);
    if (parsed != null && parsed.hasScheme) {
      href = parsed.path.isEmpty ? '/' : parsed.path;
    }
    if (!href.startsWith('/')) href = '/$href';
    if (!href.endsWith('/')) href = '$href/';
    return href;
  }

  @pragma('vm:prefer-inline')
  @override
  Uri? getCurrentUrl() {
    return Uri.tryParse(web.window.location.href);
  }

  @pragma('vm:prefer-inline')
  @override
  void pushState(Uri state) {
    final fullPath =
        urlStrategy?.prepareExternalUrl(state.pathAndQuery) ??
        state.pathAndQuery;
    web.window.history.pushState(null, '', fullPath);
  }

  @pragma('vm:prefer-inline')
  @override
  void replaceState(Uri state) {
    final fullPath =
        urlStrategy?.prepareExternalUrl(state.pathAndQuery) ??
        state.pathAndQuery;
    web.window.history.replaceState(null, '', fullPath);
  }

  @override
  void addStateCallback(PopStateCallback callback) {
    _callbacks.add(callback);
    _subscription ??= web.window.onPopState.listen((event) {
      final currentUrl = getCurrentUrl();
      if (currentUrl == null) return;
      final stripped = stripBaseHref(currentUrl);
      final appRelativeUri = Uri(
        path: stripped.path,
        query: stripped.query.isEmpty ? null : stripped.query,
        fragment: stripped.fragment.isEmpty ? null : stripped.fragment,
      );
      for (final cb in _callbacks.toList()) {
        cb(appRelativeUri);
      }
      final fullPath =
          urlStrategy?.prepareExternalUrl(appRelativeUri.pathAndQuery) ??
          appRelativeUri.pathAndQuery;
      web.window.history.replaceState(null, '', fullPath);
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
