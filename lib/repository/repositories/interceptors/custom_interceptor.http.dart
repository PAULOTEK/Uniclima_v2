import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class CustomInterceptors extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (kDebugMode) {
      debugPrint(json.encode("BaseURL: ${options.baseUrl}"));
      debugPrint(json.encode("Endpoint: ${options.path}"));
      debugPrint(json.encode("Method: ${options.method}"));
      if (options.headers['Authorization'] != null) {
        debugPrint("Authorization: ${options.headers['Authorization']}");
      }
      if (options.headers['app_version'] != null) {
        debugPrint("App Version: ${options.headers['app_version']}");
      }
      if (options.data is dio.FormData) {
        debugPrint("Payload FIELDS: ${options.data.fields.toString()}");
        // debugPrint("Payload FILES: ${options.data.arquivos.toString()}");
      } else if (options.data != null) {
        debugPrint("Payload: ${json.encode(options.data)}");
      }
    }

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint("ERROR DIO");
    debugPrint(err.response?.data.toString());
    switch (err.type) {
      case DioErrorType.connectionTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.badResponse:
        switch (err.response?.statusCode) {
          case 400:
            throw "${err.response?.data["message"] ?? "Erro 400".tr}";
          case 403:
            throw ForbiddenRequestException(err.requestOptions, err.response);
          case 422:
            throw err.response != null ? err.response!.data : '';
          case 401:
            throw UnauthorizedException(err.requestOptions);
          case 404:
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw err.response?.data.toString() ?? "Erro de servidor".tr;
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.connectionError:
        throw NoInternetConnectionException(err.requestOptions);
      case DioErrorType.badCertificate:
        throw CertificateException(err.requestOptions.toString());
      case DioErrorType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
    }

    return handler.next(err);
  }

  // String getToken(String token) {
  //   return 'Bearer $token';
  // }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r, dio.Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return "${response?.data["message"] ?? " Erro 400".tr}";
  }
}

class ForbiddenRequestException extends DioError {
  ForbiddenRequestException(RequestOptions r, dio.Response? response)
      : super(requestOptions: r, response: response);

  @override
  String toString() {
    return "${response?.data["message"] ?? "Erro 400".tr}";
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r, dio.Response? response)
      : super(requestOptions: r);

  @override
  String toString() {
    print(response?.data);
    return response?.data.toString() ?? "Erro de servidor".tr;
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "Error de conflito".tr;
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "exceção não autorizada".tr;
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return " exceção não encontrada".tr;
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "Erro de conexão com internet".tr;
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return "prazo excedido exceção".tr;
  }
}
