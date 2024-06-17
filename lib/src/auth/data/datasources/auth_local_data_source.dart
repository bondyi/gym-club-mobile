import 'package:gym_club_mobile/core/errors/exceptions.dart';
import 'package:gym_club_mobile/core/utils/constants.dart';
import 'package:gym_club_mobile/src/auth/data/models/token_pair_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<TokenPairModel> getTokens();

  Future<void> logoutUser();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<TokenPairModel> getTokens() async {
    try {
      final accessToken = _preferences.getString(spAccessTokenKey);
      final refreshToken = _preferences.getString(spRefreshTokenKey);

      return TokenPairModel(
        accessToken: accessToken!,
        refreshToken: refreshToken!,
      );
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await _preferences.setString(spAccessTokenKey, accessToken);
      await _preferences.setString(spRefreshTokenKey, refreshToken);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }

  @override
  Future<void> logoutUser() async {
    try {
      await _preferences.remove(spAccessTokenKey);
      await _preferences.remove(spRefreshTokenKey);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
