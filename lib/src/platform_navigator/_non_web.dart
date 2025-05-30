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

import '_platform_navigator_base.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

final class PlatformNavigator extends PlatformNavigatorBase {
  static const i = PlatformNavigator._();
  const PlatformNavigator._();
  factory PlatformNavigator() {
    return i;
  }

  @override
  @pragma('vm:prefer-inline')
  Uri? getCurrentUrl() {
    // No-op
    return null;
  }

  @override
  @pragma('vm:prefer-inline')
  void pushState(Uri state) {
    // No-op
  }

  @override
  @pragma('vm:prefer-inline')
  void replaceState(Uri state) {
    // No-op
  }

  @override
  @pragma('vm:prefer-inline')
  void addStateCallback(PopStateCallback callback) {
    // No-op
  }

  @override
  @pragma('vm:prefer-inline')
  bool removeStateCallback(PopStateCallback callback) {
    // No-op
    return true;
  }
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

PlatformNavigatorBase get platformNavigator => PlatformNavigator();
