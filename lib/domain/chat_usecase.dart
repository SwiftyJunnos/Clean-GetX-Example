import '../data/chat_repository.dart';

abstract interface class ChatUseCase {
  Stream<String> completion(String message);
}

class LiveChatUseCase implements ChatUseCase {
  final ChatRepository chatRepository;

  LiveChatUseCase({required this.chatRepository});

  @override
  Stream<String> completion(String message) async* {
    yield* chatRepository.completion(message);
  }
}
