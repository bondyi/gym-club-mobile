import 'dart:io';

import 'package:gym_club_mobile/core/errors/exceptions.dart';
import 'package:gym_club_mobile/core/utils/constants.dart';
import 'package:gym_club_mobile/src/profile/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> getById({
    required int id,
    required String accessToken,
  });

  Future<UserModel> put({
    required UserModel user,
    required String accessToken,
  });

  Future<void> delete({
    required int id,
    required String accessToken,
  });
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  const UserRemoteDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<void> delete({required int id, required String accessToken}) async {
    try {
      final requestHeadersWithAuth = {...requestHeaders};
      requestHeadersWithAuth['Authorization'] = 'Bearer $accessToken';

      final response = await _client.delete(
        Uri.http(baseUrl, '$usersEndpoint/$id'),
        headers: requestHeadersWithAuth,
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      throw const ServerException(
        message: 'The server is not responding, try again later.',
        statusCode: 521,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<UserModel> getById({
    required int id,
    required String accessToken,
  }) async {
    try {
      final requestHeadersWithAuth = {...requestHeaders};
      requestHeadersWithAuth['Authorization'] = 'Bearer $accessToken';

      final response = await _client.get(
        Uri.http(baseUrl, '$usersEndpoint/$id'),
        headers: requestHeadersWithAuth,
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      return UserModel.fromJson(response.body);
    } on SocketException {
      throw const ServerException(
        message: 'The server is not responding, try again later.',
        statusCode: 521,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<UserModel> put({
    required UserModel user,
    required String accessToken,
  }) async {
    try {
      final requestHeadersWithAuth = {...requestHeaders};
      requestHeadersWithAuth['Authorization'] = 'Bearer $accessToken';

      final response = await _client.put(
        Uri.http(baseUrl, '$usersEndpoint/${user.userId}'),
        headers: requestHeadersWithAuth,
        body: user.toJson(),
      );

      if (response.statusCode != 200) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      return UserModel.fromJson(response.body);
    } on SocketException {
      throw const ServerException(
        message: 'The server is not responding, try again later.',
        statusCode: 521,
      );
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
