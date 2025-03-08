import 'dart:io';
import 'package:logger/logger.dart';

final logger = Logger();

abstract interface class ChatRepository {
  Future<String> fetchAPIKey();
  Stream<String> completion(String message);
}

class LiveChatRepository implements ChatRepository {
  @override
  Future<String> fetchAPIKey() async {
    try {
      // Read the API key from a file at the project root
      final file = File('API_SECRET');

      // Check if the file exists
      if (await file.exists()) {
        // Read the file content and trim any whitespace
        final apiKey = await file.readAsString();
        return apiKey.trim();
      } else {
        throw Exception(
          'API key file not found. Please create a file named "API_SECRET" in the project root directory.',
        );
      }
    } catch (e) {
      throw Exception('Failed to read API key: $e');
    }
  }

  @override
  Stream<String> completion(String message) async* {
    // Simulate a delay for the response
    await Future.delayed(const Duration(seconds: 2));
    yield 'Response: $message';
  }
}

class DemoChatRepository implements ChatRepository {
  @override
  Future<String> fetchAPIKey() async {
    return 'DEMO_API_KEY';
  }

  @override
  Stream<String> completion(String message) async* {
    // Split string into characters
    final characters = message.split('');

    for (final char in characters) {
      await Future.delayed(const Duration(milliseconds: 10));
      yield char;
    }
  }
}
