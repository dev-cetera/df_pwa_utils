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

import 'package:df_pwa_utils/df_pwa_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('platformNavigator (non-web)', () {
    test('singleton identity', () {
      expect(identical(platformNavigator, platformNavigator), isTrue);
      expect(identical(PlatformNavigator(), PlatformNavigator()), isTrue);
    });

    test('getCurrentUrl returns null', () {
      expect(platformNavigator.getCurrentUrl(), isNull);
    });

    test('stripBaseHref returns the url unchanged', () {
      final url = Uri.parse('https://example.com/app/home?x=1');
      expect(platformNavigator.stripBaseHref(url), url);
    });

    test('pushState and replaceState are no-ops', () {
      expect(
        () => platformNavigator.pushState(Uri.parse('/home')),
        returnsNormally,
      );
      expect(
        () => platformNavigator.replaceState(Uri.parse('/about')),
        returnsNormally,
      );
    });

    test('addStateCallback never fires and removeStateCallback returns false',
        () {
      var fired = false;
      void cb(Uri _) => fired = true;
      platformNavigator.addStateCallback(cb);
      expect(platformNavigator.removeStateCallback(cb), isFalse);
      expect(fired, isFalse);
    });
  });

  group('setToUrlPathStrategy (non-web)', () {
    test('is a no-op and does not throw', () {
      expect(setToUrlPathStrategy, returnsNormally);
    });
  });
}
