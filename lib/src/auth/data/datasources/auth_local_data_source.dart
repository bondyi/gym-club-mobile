import 'package:gym_club_mobile/core/errors/exceptions.dart';
import 'package:gym_club_mobile/src/auth/data/models/token_pair_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  });

  Future<TokenPairModel> getTokens();
}

const kAccessTokenKey = 'accessToken';
const kRefreshTokenKey = 'refreshToken';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  const AuthLocalDataSourceImpl(this._preferences);

  final SharedPreferences _preferences;

  @override
  Future<TokenPairModel> getTokens() async {
    try {
      final accessToken = _preferences.getString(kAccessTokenKey);
      final refreshToken = _preferences.getString(kRefreshTokenKey);

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
      await _preferences.setString(kAccessTokenKey, accessToken);
      await _preferences.setString(kRefreshTokenKey, refreshToken);
    } catch (e) {
      throw CacheException(message: e.toString());
    }
  }
}
