import 'package:flutter/material.dart';

/// Run History page - Historial y auditoría de ejecuciones
class RunHistoryPage extends StatelessWidget {
  const RunHistoryPage({Key? key}) : super(key: key);

  static const String name = 'run_history';
  static const String path = '/run-history';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Run History'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.history, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('No runs yet'),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.play_circle_outline),
              label: const Text('Start New Run'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Navigate to Run Studio')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
