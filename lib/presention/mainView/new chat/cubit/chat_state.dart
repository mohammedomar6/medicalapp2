part of 'chat_cubit.dart';

class ChatState {
  final List<Massage> messages;
  const ChatState({
    this.messages = const [],
  });

  ChatState copyWith({
    List<Massage>? messages,
  }) {
    return ChatState(messages: messages ?? this.messages);
  }
}
