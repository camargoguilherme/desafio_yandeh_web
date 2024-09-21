import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

import '../interfaces/i_http_client.dart';

class CustomDio implements IHttpClient {
  final Dio _client;

  CustomDio(this._client, String apiUrl, {String? token}) {
    _client.options.baseUrl = apiUrl;
    _client.options.headers["Accept"] = "*/*";
    _client.options.headers["accept-language"] = WidgetsBinding
        .instance.platformDispatcher.locale
        .toString()
        .replaceAll("_", "-");
    // _client.options.connectTimeout = 5000;
    _client.options.headers["Token"] = token;
    _client.interceptors.addAll([
      if (kDebugMode)
        TalkerDioLogger(
          settings: const TalkerDioLoggerSettings(
            printRequestHeaders: true,
            printResponseHeaders: true,
            printResponseMessage: true,
            printRequestData: true,
            printResponseData: true,
          ),
        ),
    ]);
  }

  @override
  Future<Response> get(String endpoint, {dynamic queryParameters}) async {
    return await _client.get(endpoint, queryParameters: queryParameters);
  }

  @override
  Future<Response> post(String endpoint, {dynamic data}) async {
    return await _client.post(endpoint, data: data);
  }

  @override
  Future<Response> delete(String endpoint,
      {dynamic data, dynamic queryParameters}) async {
    return await _client.delete(endpoint,
        data: data, queryParameters: queryParameters);
  }

  @override
  Future<Response> put(String endpoint, {dynamic data}) async {
    return await _client.put(endpoint, data: data);
  }
}
