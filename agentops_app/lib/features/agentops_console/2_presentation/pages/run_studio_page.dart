import 'package:flutter/material.dart';

/// Run Studio page - Chat e interacción con agentes
class RunStudioPage extends StatelessWidget {
  const RunStudioPage({Key? key}) : super(key: key);

  static const String name = 'run_studio';
  static const String path = '/run-studio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Run Studio'),
      ),
      body: Column(
        children: [
          // Chat area placeholder
          Expanded(
            child: Container(
              color: Colors.grey[50],
              child: const Center(
                child: Text(
                  'Chat interface will be displayed here',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ),
          // Input area placeholder
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.grey[300]!)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Send message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                FloatingActionButton(
                  mini: true,
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Message sent')),
                    );
                  },
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
