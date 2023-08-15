import 'package:bloc/bloc.dart';
import 'package:dart_openai/openai.dart';
import 'package:dartz/dartz.dart';
import 'package:medicalapp2/app/error/failures.dart';
import 'package:medicalapp2/app/unified_api/handling_exception_manager.dart';

import '../masseage.dart';

part 'chat_state.dart';

class ChatRequest with HandlingExceptionManager {
  Future<Either<Failure, OpenAIChatCompletionModel>> sendMessageToChatgptr(
      String message) async {
    return wrapHandling(tryCall: () async {
      return Right(
          await OpenAI.instance.chat.create(model: "gpt-3.5-turbo", messages: [
        OpenAIChatCompletionChoiceMessageModel(
            role: OpenAIChatMessageRole.user, content: message)
      ]));
    });
  }
}

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());

  sendTextToChatGpt(String message) async {
    emit(state.copyWith(
        messages: List.of(state.messages)
          ..add(Massage(
              title: message, time: DateTime.now(), isSentbyme: true))));
    final result = await ChatRequest().sendMessageToChatgptr(message);
    result.fold(
        (l) => print(l),
        (r) => emit(state.copyWith(
            messages: List.of(state.messages)
              ..add(Massage(
                  title: r.choices.first.message.content,
                  time: DateTime.now(),
                  isSentbyme: false)))));
  }
}
