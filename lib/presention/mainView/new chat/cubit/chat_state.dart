part of 'chat_cubit.dart';

class ChatState {
  final String? message;
  const ChatState({this.message});

  ChatState copyWith({
    String? message,
  }) {
    return ChatState(
      message: message ?? this.message,
    );
  }
}
