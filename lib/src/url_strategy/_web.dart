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

import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

/// Initializes the URL path strategy for the application.
///
/// On web platforms, it sets the [PathUrlStrategy] to remove the
/// '#' from URLs. On non-web platforms, it performs a no-op.
@pragma('vm:prefer-inline')
void setToUrlPathStrategy() {
  if (kIsWeb) {
    try {
      setUrlStrategy(PathUrlStrategy());
    } catch (_) {
      // Ignore errors during hot reloading since setUrlStrategy can only be set once.
    }
  }
}

/// Initializes the URL hash strategy for the application.
///
/// On web platforms, it sets the [HashUrlStrategy] so URLs look like
/// '/#/home'. This is useful for static hosts where server-side routing
/// for clean paths is not available. On non-web platforms, it performs
/// a no-op.
@pragma('vm:prefer-inline')
void setToUrlHashStrategy() {
  if (kIsWeb) {
    try {
      setUrlStrategy(const HashUrlStrategy());
    } catch (_) {
      // Ignore errors during hot reloading since setUrlStrategy can only be set once.
    }
  }
}
