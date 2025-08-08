[![banner](https://github.com/dev-cetera/df_pwa_utils/blob/v0.3.5/doc/assets/banner.png?raw=true)](https://github.com/dev-cetera)

[![pub](https://img.shields.io/pub/v/df_pwa_utils.svg)](https://pub.dev/packages/df_pwa_utils)
[![tag](https://img.shields.io/badge/Tag-v0.3.5-purple?logo=github)](https://github.com/dev-cetera/df_pwa_utils/tree/v0.3.5)
[![buymeacoffee](https://img.shields.io/badge/Buy%20Me%20A%20Coffee-FFDD00?logo=buy-me-a-coffee&logoColor=black)](https://www.buymeacoffee.com/dev_cetera)
[![sponsor](https://img.shields.io/badge/Sponsor-grey?logo=github-sponsors&logoColor=pink)](https://github.com/sponsors/dev-cetera)
[![patreon](https://img.shields.io/badge/Patreon-grey?logo=patreon)](https://www.patreon.com/t0mb3rr)
[![discord](https://img.shields.io/badge/Discord-5865F2?logo=discord&logoColor=white)](https://discord.gg/gEQ8y2nfyX)
[![instagram](https://img.shields.io/badge/Instagram-E4405F?logo=instagram&logoColor=white)](https://www.instagram.com/dev_cetera/)
[![license](https://img.shields.io/badge/License-MIT-blue.svg)](https://raw.githubusercontent.com/dev-cetera/df_pwa_utils/main/LICENSE)

---

<!-- BEGIN _README_CONTENT -->

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

<!-- END _README_CONTENT -->

---

🔍 For more information, refer to the [API reference](https://pub.dev/documentation/df_pwa_utils/).

---

## 💬 Contributing and Discussions

This is an open-source project, and we warmly welcome contributions from everyone, regardless of experience level. Whether you're a seasoned developer or just starting out, contributing to this project is a fantastic way to learn, share your knowledge, and make a meaningful impact on the community.

### ☝️ Ways you can contribute

- **Find us on Discord:** Feel free to ask questions and engage with the community here: https://discord.gg/gEQ8y2nfyX.
- **Share your ideas:** Every perspective matters, and your ideas can spark innovation.
- **Help others:** Engage with other users by offering advice, solutions, or troubleshooting assistance.
- **Report bugs:** Help us identify and fix issues to make the project more robust.
- **Suggest improvements or new features:** Your ideas can help shape the future of the project.
- **Help clarify documentation:** Good documentation is key to accessibility. You can make it easier for others to get started by improving or expanding our documentation.
- **Write articles:** Share your knowledge by writing tutorials, guides, or blog posts about your experiences with the project. It's a great way to contribute and help others learn.

No matter how you choose to contribute, your involvement is greatly appreciated and valued!

### ☕ We drink a lot of coffee...

If you're enjoying this package and find it valuable, consider showing your appreciation with a small donation. Every bit helps in supporting future development. You can donate here: https://www.buymeacoffee.com/dev_cetera

<a href="https://www.buymeacoffee.com/dev_cetera" target="_blank"><img src="https://cdn.buymeacoffee.com/buttons/default-orange.png" height="40"></a>

## LICENSE

This project is released under the [MIT License](https://raw.githubusercontent.com/dev-cetera/df_pwa_utils/main/LICENSE). See [LICENSE](https://raw.githubusercontent.com/dev-cetera/df_pwa_utils/main/LICENSE) for more information.

