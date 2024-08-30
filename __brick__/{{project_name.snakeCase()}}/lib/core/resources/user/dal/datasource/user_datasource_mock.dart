import 'dart:convert';
import 'dart:developer';

import '../../../../base/utils/mock_util.dart';
import '../../domain/exceptions/email_already_in_use_exception.dart';
import '../../domain/exceptions/user_or_password_incorrect_exception.dart';
import '../dto/authenticate_user_body.dart';
import '../dto/authenticate_user_response.dart';
import '../dto/sign_up_body.dart';
import 'user_datasource_interface.dart';
import 'user_path_mocks_constants.dart';

class UserDatasourceMock implements IUserDatasource {
  Future<AuthenticateUserResponse> _getMock(String path) async {
    final file = await MockUtil.getMockFile(path);
    final response = AuthenticateUserResponse.fromJson(jsonDecode(file));

    return response;
  }

  @override
  Future<AuthenticateUserDataResponse> authenticateUser(
    AuthenticateUserBody body,
  ) async {
    await Future.delayed(const Duration(seconds: 1));
    if (body.email.toLowerCase() != 'katekko@gmail.com' ||
        body.password != 'qwe123') {
      final mock = await _getMock(
        UserPathMocksConstants.authenticateUserFailure,
      );
      throw UserOrPasswordIncorrectException(failure: mock.errors!.first);
    }

    final response = await _getMock(
      UserPathMocksConstants.authenticateUserSuccess,
    );

    log(
      name: 'MOCK',
      'authenticateUser - email:${body.email}, password:${body.password}',
    );

    return response.data!;
  }

  @override
  Future<void> signUp(SignUpBody body) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      if (body.email == 'katekko@gmail.com') {
        final mock = await _getMock(
          UserPathMocksConstants.signUpEmailAlreadyExists,
        );

        throw EmailAlreadyInUseException(failure: mock.errors!.first);
      }

      log(
        name: 'MOCK',
        'signUp - email:${body.email}, password:${body.password}',
      );
    } catch (err) {
      rethrow;
    }
  }
}
