A lightweight and high-performance Flutter plugin for managing application badge counts exclusively on iOS and macOS. It leverages Dart's Foreign Function Interface (FFI) for direct and efficient communication with native APIs.

## Why "Fast"? (FFI Advantage)

Unlike many Flutter plugins that rely on platform channels (MethodChannel) for communication between Dart and native code, `fast_app_badge` utilizes **Dart's Foreign Function Interface (FFI)**. This approach allows for direct calls to native Objective-C APIs without the overhead of serialization and deserialization, resulting in faster execution and reduced boilerplate. This makes `fast_app_badge` an ideal choice for performance-critical applications targeting iOS and macOS.

## Features

- Set the application badge count to a specific number.
- Clear the application badge count (set to 0).
- Request permission for displaying notifications and badges on iOS.

## Usage

Here's how to use `fast_app_badge`:

```dart
import 'package:fast_app_badge/fast_app_badge.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _badgeCount = 0;

  @override
  void initState() {
    super.initState();
    // It's good practice to request permission on iOS first
    FastAppBadge.requestBadgePermission();
  }

  void _incrementBadge() {
    setState(() {
      _badgeCount++;
      FastAppBadge.updateBadge(_badgeCount);
    });
  }

  void _decrementBadge() {
    setState(() {
      if (_badgeCount > 0) {
        _badgeCount--;
        FastAppBadge.updateBadge(_badgeCount);
      }
    });
  }

  void _clearBadge() {
    setState(() {
      _badgeCount = 0;
      FastAppBadge.clearBadge();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('App Badge Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Current Badge Count: $_badgeCount'),
              ElevatedButton(
                onPressed: _incrementBadge,
                child: const Text('Increment Badge'),
              ),
              ElevatedButton(
                onPressed: _decrementBadge,
                child: const Text('Decrement Badge'),
              ),
              ElevatedButton(
                onPressed: _clearBadge,
                child: const Text('Clear Badge'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

## Additional information

This package is designed specifically for **iOS and macOS applications**. Android is not currently supported.

For more information, please visit the [GitHub repository](https://github.com/koji-1009/fast_app_badge).
If you encounter any issues, feel free to file them on the GitHub issue tracker.
