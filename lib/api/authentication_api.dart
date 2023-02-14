import 'dart:io';
import 'package:flutter_apis_rest/helpers/http_response.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:meta/meta.dart' show required;

class AuthenticationAPI {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'https://www.tasksontrack.com',
    ),
  );
  final Logger _logger = Logger();

  Future<HttpResponse> register(
      String username, String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/v1/register',
        data: {
          'username': username,
          'email': email,
          'password': password,
        },
      );
      _logger.i(response.data);
      return HttpResponse.success(response.data);
    } catch (e) {
      _logger.e(e);

      int statusCode = -1; //
      String message = 'Unknown error';
      dynamic data;

      if (e is DioError) {
        message = e.message;
        if (e.response != null) {
          statusCode = e.response!.statusCode ?? -1; //
          message = e.response!.statusMessage ?? 'Unknown error';
          data = e.response!.data;
        }
      }

      return HttpResponse.fail(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }

  Future<HttpResponse> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/v1/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      _logger.i(response.data);
      return HttpResponse.success(response.data);
    } catch (e) {
      _logger.e(e);

      int statusCode = -1; //
      String message = 'Unknown error';
      dynamic data;

      if (e is DioError) {
        message = e.message;
        if (e.response != null) {
          statusCode = e.response!.statusCode ?? -1;
          message = e.response!.statusMessage ?? 'Unknown error';
          data = e.response!.data;
        }
      }

      return HttpResponse.fail(
        statusCode: statusCode,
        message: message,
        data: data,
      );
    }
  }
}
