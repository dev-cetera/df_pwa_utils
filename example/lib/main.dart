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
import 'package:flutter/material.dart';

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

void main() {
  // Switch off hash-based URLs on web so paths look like '/home' instead of
  // '/#/home'. No-op on non-web platforms.
  setToUrlPathStrategy();
  runApp(const ExampleApp());
}

// ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

class ExampleApp extends StatefulWidget {
  const ExampleApp({super.key});

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  String _path = '/';

  @override
  void initState() {
    super.initState();
    final current = platformNavigator.getCurrentUrl();
    if (current != null) {
      _path = current.path.isEmpty ? '/' : current.path;
    }
    platformNavigator.addStateCallback(_onPopState);
  }

  @override
  void dispose() {
    platformNavigator.removeStateCallback(_onPopState);
    super.dispose();
  }

  void _onPopState(Uri url) {
    setState(() {
      _path = url.path.isEmpty ? '/' : url.path;
    });
  }

  void _go(String path) {
    platformNavigator.pushState(Uri.parse(path));
    setState(() {
      _path = path;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('df_pwa_utils example')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Current path: $_path'),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                children: [
                  ElevatedButton(
                    onPressed: () => _go('/'),
                    child: const Text('/'),
                  ),
                  ElevatedButton(
                    onPressed: () => _go('/home'),
                    child: const Text('/home'),
                  ),
                  ElevatedButton(
                    onPressed: () => _go('/about'),
                    child: const Text('/about'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
