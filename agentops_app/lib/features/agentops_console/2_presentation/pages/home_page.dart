import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Home page - Dashboard principal de AgentOps Console
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String name = 'home';
  static const String path = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AgentOps Console'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to AgentOps Console',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),
                _NavigationButton(
                  label: 'Agents',
                  icon: Icons.smart_toy,
                  onPressed: () => context.go('/agents'),
                ),
                const SizedBox(height: 16),
                _NavigationButton(
                  label: 'Context Base',
                  icon: Icons.folder_open,
                  onPressed: () => context.go('/context-base'),
                ),
                const SizedBox(height: 16),
                _NavigationButton(
                  label: 'Run Studio',
                  icon: Icons.play_circle_outline,
                  onPressed: () => context.go('/run-studio'),
                ),
                const SizedBox(height: 16),
                _NavigationButton(
                  label: 'Run History',
                  icon: Icons.history,
                  onPressed: () => context.go('/run-history'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NavigationButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const _NavigationButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton.icon(
        icon: Icon(icon, size: 24),
        label: Text(label, style: const TextStyle(fontSize: 16)),
        onPressed: onPressed,
      ),
    );
  }
}
