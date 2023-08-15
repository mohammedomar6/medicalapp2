import 'package:bloc/bloc.dart';
import 'package:dart_openai/openai.dart';
import 'package:dartz/dartz.dart';
import 'package:medicalapp2/app/error/failures.dart';
import 'package:medicalapp2/app/unified_api/handling_exception_manager.dart';

part 'chat_state.dart';

class ChatRequest with HandlingExceptionManager {
  Future<Either<Failure, OpenAIModerationModel>> sendMessageToChatgptr(
      String message) async {
    return wrapHandling(tryCall: () async {
      return Right(await OpenAI.instance.moderation.create(input: message));
    });
  }
}

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState());

  sendTextToChatGpt(String message) async {
    final result = await ChatRequest().sendMessageToChatgptr(message);
    result.fold((l) => null, (r) => emit(state.copyWith(message: r.model)));

  }
}
