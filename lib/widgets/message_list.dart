import 'package:flutter/material.dart';

import '../constants/strings.dart';

class MessageListWidget extends StatelessWidget {
  MessageListWidget({
    super.key,
    required this.channelStream,
    required this.messages,
    required this.currentMessage,
  });

  final Stream<dynamic> channelStream;
  final List<String> messages;
  String currentMessage;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: channelStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          String receivedMessage = snapshot.data.toString();

          // Add received message only if it's valid
          if (!receivedMessage.contains(Strings.requestServedBy) &&
              receivedMessage == currentMessage) {
            currentMessage = '';
            messages.add('${Strings.received} : $receivedMessage');
          }
        }

        return ListView.builder(
          itemCount: messages.length,
          itemBuilder: (context, index) {
            bool isSentMessage = messages[index].startsWith(Strings.sent);
            return Align(
              alignment:
                  isSentMessage ? Alignment.centerRight : Alignment.centerLeft,
              child: Card(
                color: isSentMessage ? Colors.deepPurple[100] : Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  leading: isSentMessage
                      ? null
                      : const Icon(Icons.message, color: Colors.deepPurple),
                  trailing: isSentMessage
                      ? const Icon(Icons.send, color: Colors.deepPurple)
                      : null,
                  title: Text(
                    messages[index],
                    style: TextStyle(
                      color: isSentMessage ? Colors.deepPurple : Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
