import 'package:dartz/dartz.dart';
import 'package:gym_club_mobile/core/errors/exceptions.dart';
import 'package:gym_club_mobile/core/errors/failure.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/data/datasources/auth_local_data_source.dart';
import 'package:gym_club_mobile/src/profile/data/datasources/user_remote_data_source.dart';
import 'package:gym_club_mobile/src/profile/data/models/user_model.dart';
import 'package:gym_club_mobile/src/profile/domain/entities/user.dart';
import 'package:gym_club_mobile/src/profile/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  const UserRepositoryImpl(this._remoteDataSource, this._localDataSource);

  final UserRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;

  @override
  ResultFuture<void> delete({
    required int id,
    required String accessToken,
  }) async {
    try {
      return Right(
        await _remoteDataSource.delete(
          id: id,
          accessToken: accessToken,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> getById({
    required int id,
    required String accessToken,
  }) async {
    try {
      return Right(
        await _remoteDataSource.getById(
          id: id,
          accessToken: accessToken,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<User> put({
    required User user,
    required String accessToken,
  }) async {
    try {
      return Right(
        await _remoteDataSource.put(
          user: user as UserModel,
          accessToken: accessToken,
        ),
      );
    } on ServerException catch (e) {
      return Left(ServerFailure.fromException(e));
    }
  }

  @override
  ResultFuture<void> logoutUser() async {
    try {
      await _localDataSource.logoutUser();
      return const Right(null);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.message, statusCode: e.statusCode));
    }
  }
}
