import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:weather_app/di/di.dart';
import 'package:weather_app/domain/exceptions/exception_handlers.dart';

class NetworkClient {
  final Dio dio = Dio();
  String baseUrl = 'https://api.open-meteo.com/v1/forecast?';
  NetworkClient() {
    dio.interceptors.add(
      TalkerDioLogger(
        talker: GetIt.I<Talker>(),
        settings: const TalkerDioLoggerSettings(
          printResponseData: false,
        ),
      ),
    );
  }

  Future<T> get<T>(
    String path,
    T Function(dynamic json) parser, [
    Map<String, dynamic>? parameters,
  ]) async {
    // final url = _makeUri(path, parameters);
    try {
      final response =
          await dio.get('$baseUrl$path', queryParameters: parameters);
      return parser(response.data);
    } catch (e, st) {
      instance<Talker>().handle(e, st);
      throw ExceptionHandlers().getExceptionString(e);
    }
  }

  //    Future<T> get<T>(
  //   String path,
  //   T Function(dynamic json) parser, [
  //   Map<String, dynamic>? parameters,
  // ]) async {
  //   final url = _makeUri(path, parameters);
  //   try {
  //     final request = await _client.getUrl(url);
  //     final response = await request.close();
  //     final dynamic json = (await response.jsonDecode());
  //     // _validateResponse(response, json);
  //     final result = parser(json);
  //     return result;
  //   } on SocketException {
  //     throw ApiClientException(ApiClientExceptionType.network);
  //   } on ApiClientException {
  //     rethrow;
  //   } catch (e) {
  //     throw ApiClientException(ApiClientExceptionType.other);
  //   }
  // }

}

