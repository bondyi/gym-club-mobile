import 'package:equatable/equatable.dart';

import 'package:gym_club_mobile/core/errors/exceptions.dart';

abstract class Failure extends Equatable {
  Failure({required this.message, required this.statusCode})
      : assert(
          statusCode is int || statusCode is String,
          'Status code cannot be a ${statusCode.runtimeType}',
        );

  final String message;
  final dynamic statusCode;

  String get errorMessage => message;

  String get errorMessageWithStatusCode => '$statusCode Error: $errorMessage';

  @override
  List<dynamic> get props => [message, statusCode];
}

class CacheFailure extends Failure {
  CacheFailure({required super.message, required super.statusCode});

  CacheFailure.fromException(CacheException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}

class ServerFailure extends Failure {
  ServerFailure({required super.message, required super.statusCode});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message, statusCode: exception.statusCode);
}
