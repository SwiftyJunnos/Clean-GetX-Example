import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'chat_controller.dart';
import 'chat_view.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(middle: Text('Chat App')),
      child: SafeArea(child: ChatView()),
    );
  }
}
