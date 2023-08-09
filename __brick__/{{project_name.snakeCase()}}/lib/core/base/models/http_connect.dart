import 'dart:convert';
import 'dart:developer' as developer;

import 'package:http/http.dart' as http;

import '../../../config.dart';
import '../abstractions/http_connect.interface.dart';
import '../abstractions/response.model.dart';
import '../exceptions/http_failure.exception.dart';

class HttpConnect implements IHttpConnect {
  final http.Client _client;
  HttpConnect(http.Client client) : _client = client;
  final urlConfig = ConfigEnvironments.getEnvironments()['url'];

  String get urlBase =>
      urlConfig != null ? urlConfig! : throw Exception('Url not found');

  @override
  Future<Response<T>> get<T>(
    String urlPath, {
    required T Function(Map<String, dynamic>)? decoder,
  }) async {
    var response = await _client.get(Uri.parse('$urlBase/$urlPath'));

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    T? decoded;

    try {
      decoded = decoder?.call(json);
    } catch (err) {
      developer.log(
        'GET | Failed to decode the response body',
        error: response.body,
        name: 'HttpConnect',
      );
      rethrow;
    }

    final obj = Response<T>(statusCode: response.statusCode, payload: decoded);

    final payload = obj.payload;
    assert(payload != null, 'Payload is null, see the decoder function');
    if (!obj.success && payload != null) {
      developer.log(
        'GET | Request failed',
        error: response.body,
        name: 'HttpConnect',
      );
      throw HttpFailureException<T>(object: payload);
    }

    return obj;
  }

  @override
  Future<Response<T>> post<T>(
    String urlPath,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic>)? decoder,
  }) async {
    final bodyString =
        body.map((key, value) => MapEntry(key, value.toString()));

    var response = await _client.post(
      Uri.parse('$urlBase/$urlPath'),
      body: bodyString,
    );

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    T? decoded;

    try {
      decoded = decoder?.call(json);
    } catch (err) {
      developer.log(
        'POST | Failed to decode the response body',
        error: response.body,
        name: 'HttpConnect',
      );
      rethrow;
    }

    final obj = Response<T>(statusCode: response.statusCode, payload: decoded);

    final payload = obj.payload;
    assert(payload != null, 'Payload is null, see the decoder function');
    if (!obj.success && payload != null) {
      throw HttpFailureException<T>(object: payload);
    }

    return obj;
  }

  @override
  Future<Response<T>> put<T>(
    String urlPath,
    Map<String, dynamic> body, {
    T Function(Map<String, dynamic>)? decoder,
  }) async {
    final bodyString =
        body.map((key, value) => MapEntry(key, value.toString()));

    var response = await _client.put(
      Uri.parse('$urlBase/$urlPath'),
      body: bodyString,
    );

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    T? decoded;

    try {
      decoded = decoder?.call(json);
    } catch (err) {
      developer.log(
        'PUT | Failed to decode the response body',
        error: response.body,
        name: 'HttpConnect',
      );
      rethrow;
    }

    final obj = Response<T>(statusCode: response.statusCode, payload: decoded);

    final payload = obj.payload;
    assert(payload != null, 'Payload is null, see the decoder function');
    if (!obj.success && payload != null) {
      throw HttpFailureException<T>(object: payload);
    }

    return obj;
  }

  @override
  Future<Response<T>> delete<T>(
    String urlPath, {
    T Function(Map<String, dynamic>)? decoder,
  }) async {
    var response = await _client.delete(Uri.parse('$urlBase/$urlPath'));

    Map<String, dynamic>? json;
    T? decoded;
    if (response.body.isNotEmpty) {
      json = jsonDecode(response.body) as Map<String, dynamic>;

      try {
        decoded = decoder?.call(json);
      } catch (err) {
        developer.log(
          'DELETE | Failed to decode the response body',
          error: response.body,
          name: 'HttpConnect',
        );
        rethrow;
      }
    }

    final obj = Response<T>(statusCode: response.statusCode, payload: decoded);
    final payload = obj.payload;
    if (!obj.success && payload != null) {
      throw HttpFailureException<T>(object: payload);
    }

    return obj;
  }

  @override
  Future<Response<T>> postMultipartFile<T>(
    String urlPath,
    form, {
    T Function(Map<String, dynamic>)? decoder,
  }) {
    throw UnimplementedError();
  }
}
