import 'package:dartz/dartz.dart';
import 'package:gym_club_mobile/core/errors/exceptions.dart';
import 'package:gym_club_mobile/core/errors/failure.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(this._remoteDataSource);

  final AuthRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<TokenPair> loginUser({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      return Right(
        await _remoteDataSource.loginUser(
          phoneNumber: phoneNumber,
          password: password,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<TokenPair> refreshTokens({required String refreshToken}) async {
    try {
      return Right(
        await _remoteDataSource.refreshTokens(refreshToken: refreshToken),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> registerUser({
    required String phoneNumber,
    required String password,
    required String name,
    required String surname,
    required String birthDate,
    required bool gender,
  }) async {
    try {
      await _remoteDataSource.registerUser(
        phoneNumber: phoneNumber,
        password: password,
        name: name,
        surname: surname,
        birthDate: birthDate,
        gender: gender,
      );
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }
}
