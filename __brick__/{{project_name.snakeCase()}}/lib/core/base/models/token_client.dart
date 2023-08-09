import 'dart:async';
import 'package:http/http.dart' as http;

import '../../domains/user/domain/constants/user_storage.constants.dart';
import '../dal/storage/storage.interface.dart';

class TokenClient extends http.BaseClient {
  final IStorage? storage;
  final http.Client _inner = http.Client();

  TokenClient(this.storage);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    final token = await storage?.read(UserStorageConstants.tokenAuthorization);
    if (token != null) request.headers['Authorization'] = 'Bearer $token';
    return _inner.send(request);
  }
}
