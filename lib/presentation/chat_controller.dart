import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../domain/chat_usecase.dart';

class ChatController extends GetxController {
  final ChatUseCase chatUseCase;
  final TextEditingController messageController = TextEditingController();

  final resultChat = ''.obs;

  ChatController({required this.chatUseCase});

  Future<void> sendMessage(String message) async {
    resultChat.value = '';
    messageController.clear();

    await for (final chunk in chatUseCase.completion(message)) {
      resultChat.value += chunk;
    }
  }
}
