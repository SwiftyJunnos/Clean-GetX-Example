import 'package:clean_getx_example/data/chat_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'chat_controller.dart';
import '../domain/chat_usecase.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(
      ChatController(
        chatUseCase: LiveChatUseCase(chatRepository: DemoChatRepository()),
      ),
    );

    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Obx(
                () => Text(
                  controller.resultChat.value,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontSize: 16,
                    color: CupertinoColors.darkBackgroundGray,
                  ),
                ),
              ),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Expanded(
                child: CupertinoTextField(
                  controller: controller.messageController,
                  placeholder: 'Enter your message',
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              CupertinoButton(
                padding: const EdgeInsets.all(12),
                borderRadius: BorderRadius.circular(8),
                color: CupertinoColors.systemBlue,
                onPressed:
                    () => controller.sendMessage(
                      controller.messageController.text,
                    ),
                child: const Icon(
                  CupertinoIcons.paperplane,
                  color: CupertinoColors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
