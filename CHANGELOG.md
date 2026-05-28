# Changelog

## [0.4.1]

- feat: `setToUrlHashStrategy()` for opting back into `'/#/...'` URLs on static hosts; no-op on non-web.

## [0.4.0]

- breaking: `WebNavigator.onPopState` invokes callbacks with the app-relative `Uri` (base href stripped) instead of the raw URL.
- breaking: `Uri.pathAndQuery` extension now includes the fragment when present.
- fix: `<base href>` resolution handles absolute URLs (with scheme/host) and missing leading/trailing slashes.
- fix: `stripBaseHref` matches when the path equals the base href without its trailing slash.
- fix: `PlatformNavigator.removeStateCallback` on non-web now returns `false` (was incorrectly returning `true`).
- perf: `WebNavigator` pop-state handler calls `replaceState` once per pop instead of once per registered callback.