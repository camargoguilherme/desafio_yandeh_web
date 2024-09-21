import 'package:dio/dio.dart';

abstract class IHttpClient {
  Future<Response> get(String endpoint, {dynamic queryParameters});
  Future<Response> post(String endpoint, {dynamic data});
  Future<Response> put(String endpoint, {dynamic data});
  Future<Response> delete(String endpoint, {dynamic data});
}
