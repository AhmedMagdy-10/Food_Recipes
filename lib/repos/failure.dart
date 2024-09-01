import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeOut With apiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeOut With apiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeOut With apiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Response is Cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('No internet connection');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No internet connection');
        }
        return ServerFailure('Unexpected Error');

      case DioExceptionType.badCertificate:
        return ServerFailure('there was an incorrect certificate ');
    }
  }
  factory ServerFailure.fromResponse(int stutesCode, dynamic response) {
    if (stutesCode == 400 || stutesCode == 401 || stutesCode == 403) {
      return ServerFailure(response);
    } else if (stutesCode == 404) {
      return ServerFailure('Your request not found , please try Later!');
    } else if (stutesCode == 500) {
      return ServerFailure('Internal Server Error');
    } else {
      return ServerFailure('Opps there was an error please try again later');
    }
  }
}
