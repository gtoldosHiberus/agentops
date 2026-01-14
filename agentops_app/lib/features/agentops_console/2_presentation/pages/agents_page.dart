import 'package:flutter/material.dart';

/// Agents page - Gestión de agentes
class AgentsPage extends StatelessWidget {
  const AgentsPage({Key? key}) : super(key: key);

  static const String name = 'agents';
  static const String path = '/agents';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agents'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Create new agent')),
          );
        },
        tooltip: 'Create Agent',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.smart_toy, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('No agents yet'),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Create Agent'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Create new agent')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
