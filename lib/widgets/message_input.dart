import 'package:flutter/material.dart';

import '../constants/strings.dart';

class MessageInputWidget extends StatelessWidget {
  MessageInputWidget({
    super.key,
    required this.onSendMessage,
  });

  final Function(String) onSendMessage;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: _controller,
          decoration: InputDecoration(
            labelText: Strings.sendMessage,
            labelStyle: const TextStyle(color: Colors.deepPurple),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: const Icon(Icons.send, color: Colors.deepPurple),
              onPressed: () {
                onSendMessage(_controller.text);
                _controller.clear();
              },
            ),
          ),
        ),
      ),
    );
  }
}
