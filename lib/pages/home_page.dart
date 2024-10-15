import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../constants/strings.dart';
import '../constants/websocket_config.dart';
import '../widgets/message_input.dart';
import '../widgets/message_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = WebSocketChannel.connect(
    Uri.parse(wsUrl),
  );
  final List<String> _messages =
      []; // List to store all the send received messages
  String currentMessage = '';

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      _controller.sink.add(message);
      setState(() {
        _messages.add('${Strings.sent} : $message');
        currentMessage = message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Message input widget
            MessageInputWidget(onSendMessage: _sendMessage),
            const SizedBox(height: 20),

            // Message list view (sent and received messages)
            Expanded(
              child: MessageListWidget(
                channelStream: _controller.stream,
                messages: _messages,
                currentMessage: currentMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.sink.close();
    super.dispose();
  }
}
