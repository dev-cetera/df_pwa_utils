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
  group('normalizePathQuery', () {
    test('returns null for empty input', () {
      expect(normalizePathQuery(''), isNull);
    });

    test('returns null for whitespace input', () {
      expect(normalizePathQuery('   '), isNull);
    });

    test('preserves a simple path', () {
      expect(normalizePathQuery('/home'), '/home');
    });

    test('strips a trailing slash', () {
      expect(normalizePathQuery('/home/'), '/home');
    });

    test('keeps the query string', () {
      expect(normalizePathQuery('/search?q=hello'), '/search?q=hello');
    });

    test('strips trailing slash before the query', () {
      expect(normalizePathQuery('/search/?q=hello'), '/search?q=hello');
    });

    test('drops the fragment', () {
      expect(normalizePathQuery('/docs#section'), '/docs');
    });

    test('extracts path and query from an absolute URL', () {
      expect(
        normalizePathQuery('https://example.com/products?id=42'),
        '/products?id=42',
      );
    });

    test('trims surrounding whitespace before parsing', () {
      expect(normalizePathQuery('  /about  '), '/about');
    });
  });
}
