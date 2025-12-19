import 'package:fast_app_badge/fast_app_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast App Badge Demo',
      home: const BadgeDemoPage(),
    );
  }
}

class BadgeDemoPage extends StatefulWidget {
  const BadgeDemoPage({super.key});

  @override
  State<BadgeDemoPage> createState() => _BadgeDemoPageState();
}

class _BadgeDemoPageState extends State<BadgeDemoPage> {
  final _controller = TextEditingController();
  int _badgeCount = 0;

  void _setBadge(int count) {
    setState(() {
      _badgeCount = count;
    });
    FastAppBadge.updateBadge(count);
  }

  void _incrementBadge() {
    _setBadge(_badgeCount + 1);
  }

  void _clearBadge() {
    _setBadge(0);
  }

  @override
  void initState() {
    super.initState();
    final plugin = FlutterLocalNotificationsPlugin();
    plugin
        .resolvePlatformSpecificImplementation<
          IOSFlutterLocalNotificationsPlugin
        >()
        ?.requestPermissions(alert: true, badge: true, sound: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fast App Badge Demo')),
      body: Padding(
        padding: const .all(16.0),
        child: Column(
          spacing: 24,
          mainAxisAlignment: .center,
          children: [
            Text(
              'Current badge count: $_badgeCount',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Row(
              mainAxisAlignment: .center,
              children: [
                ElevatedButton(
                  onPressed: _clearBadge,
                  child: const Text('Set badge to 0'),
                ),
                const SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _incrementBadge,
                  child: const Text('+1 Badge'),
                ),
              ],
            ),
            TextField(
              controller: _controller,
              keyboardType: .number,
              decoration: const InputDecoration(
                labelText: 'Set badge to...',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                final int? count = int.tryParse(value);
                if (count != null && count >= 0) {
                  _setBadge(count);
                }
              },
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                final int? count = int.tryParse(_controller.text);
                if (count != null && count >= 0) {
                  _setBadge(count);
                }
              },
              child: const Text('Set Badge'),
            ),
          ],
        ),
      ),
    );
  }
}
