import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'presentation/chat_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetCupertinoApp(home: const ChatPage());
  }
}
