import 'package:flutter/material.dart';

/// Context Base page - Gestión de documentos y contexto
class ContextBasePage extends StatelessWidget {
  const ContextBasePage({Key? key}) : super(key: key);

  static const String name = 'context_base';
  static const String path = '/context-base';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Context Base'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Upload new context pack')),
          );
        },
        tooltip: 'Upload Context',
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.folder_open, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text('No context packs yet'),
            const SizedBox(height: 32),
            ElevatedButton.icon(
              icon: const Icon(Icons.upload_file),
              label: const Text('Upload Context Pack'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Upload new context pack')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
