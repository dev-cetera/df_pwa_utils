## Summary

Web utilities for progressive web applications (PWA). No-ops on non-web platforms. Works with WASM.

You can use this package to set the URL path strategy for your web application to use the standard URL path instead of the hash-based routing.

```dart
import 'package:df_web_utils/df_web_utils.dart';

setToUrlPathStrategy();
```

You can also use the `platformNavigator` to manage the browser history and listen for changes in the URL path.

```dart
import 'package:df_web_utils/df_web_utils.dart';
import 'package:flutter/foundation.dart' show kDebugMode;

final path = platformNavigator.getCurrentPath(); // e.g. '/home'

platformNavigator.pushState('/welcome'); // push '/welcome'

platformNavigator.replaceState('/home'); // replace current state with '/home'

platformNavigator.addStateCallback((path) {
  if (kDebugMode) {
    print('Pop state: $path');
  } // e.g. '/home'
});

```

## Getting Started

Add the package to your `pubspec.yaml:

```yaml
dependencies:
  df_pwa_utils: ^0.1.0
```

You can also use the latest version from the Git repository:

```yaml
dependencies:
  df_pwa_utils:
    git:
      url: https://github.com/dev-cetera/df_pwa_utils
      ref: main
```