import 'package:dartz/dartz.dart';
import 'package:medicalapp2/app/error/failures.dart';
import 'package:medicalapp2/app/unified_api/api_variables.dart';
import 'package:medicalapp2/app/unified_api/handling_exception_manager.dart';
import 'package:medicalapp2/app/unified_api/post_api.dart';
import 'package:medicalapp2/domin/register_model.dart';

class AuthRequests {
  Future<RegisterModel> register(RegisterParams params) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.register(),
        body: params.getBody(),
        fromJson: registerModelFromJson);
    final result = await postApi.callRequest();
    return result;
  }

  Future<RegisterModel> login(LoginParams params) async {
    PostApi postApi = PostApi(
        uri: ApiVariables.login(),
        body: params.getBody(),
        fromJson: registerModelFromJson);
    final result = await postApi.callRequest();
    return result;
  }
}

class AuthRepository with HandlingExceptionManager {
  Future<Either<Failure, RegisterModel>> register(RegisterParams params) async {
    return wrapHandling(tryCall: () async {
      return Right(await AuthRequests().register(params));
    });
  }

  Future<Either<Failure, RegisterModel>> login(LoginParams params) async {
    return wrapHandling(tryCall: () async {
      return Right(await AuthRequests().login(params));
    });
  }
}

class RegisterParams {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final String accountType;
  final String birthDate;
  final int? specializationId;
  RegisterParams({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.accountType,
    required this.birthDate,
    this.specializationId,
  });
  Map<String, dynamic> getBody() => {
        'Email': email,
        'Password': password,
        'Password_confirmation': confirmPassword,
        'Name': name,
        'AccountType': accountType,
        'Specialization_id': specializationId ?? 1,
        'BirthDate': birthDate,
        'Address_id': 1,
        'Age': 24,
        'Smoked': 1
      };
}

class LoginParams {
  final String email;
  final String password;
  LoginParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> getBody() => {'Email': email, 'Password': password};
}
