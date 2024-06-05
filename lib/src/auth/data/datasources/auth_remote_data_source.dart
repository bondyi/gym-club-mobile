import 'dart:convert';

import 'package:gym_club_mobile/core/errors/exceptions.dart';
import 'package:gym_club_mobile/core/utils/constants.dart';
import 'package:gym_club_mobile/src/auth/data/models/token_pair_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<void> registerUser({
    required String phoneNumber,
    required String password,
    required String name,
    required String surname,
    required String birthDate,
    required bool gender,
  });

  Future<TokenPairModel> loginUser({
    required String phoneNumber,
    required String password,
  });

  Future<TokenPairModel> refreshTokens({required String refreshToken});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const AuthRemoteDataSourceImpl(this._client);

  final http.Client _client;

  @override
  Future<TokenPairModel> loginUser({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      final body = jsonEncode(
        {'PhoneNumber': phoneNumber, 'Password': password},
      );

      final response = await _client.post(
        Uri.http(baseUrl, loginUserEndpoint),
        headers: requestHeaders,
        body: body,
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      return jsonDecode(response.body) as TokenPairModel;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<TokenPairModel> refreshTokens({required String refreshToken}) async {
    try {
      final response = await _client.post(
        Uri.http(baseUrl, refreshTokensEndpoint),
        headers: requestHeaders,
        body: jsonEncode({'RefreshToken': refreshToken}),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }

      return jsonDecode(response.body) as TokenPairModel;
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<void> registerUser({
    required String phoneNumber,
    required String password,
    required String name,
    required String surname,
    required String birthDate,
    required bool gender,
  }) async {
    try {
      final response = await _client.post(
        Uri.http(baseUrl, registerUserEndpoint),
        headers: requestHeaders,
        body: jsonEncode({
          'UserRole': 'client',
          'PhoneNumber': phoneNumber,
          'Password': password,
          'Name': name,
          'Surname': surname,
          'BirthDate': birthDate,
          'Gender': gender,
        }),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw ServerException(
          message: response.body,
          statusCode: response.statusCode,
        );
      }
    } on ServerException {
      rethrow;
    } catch (e) {
      throw ServerException(message: e.toString(), statusCode: 505);
    }
  }
}
