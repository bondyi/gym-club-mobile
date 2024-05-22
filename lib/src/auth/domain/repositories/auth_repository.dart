import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<void> registerUser(
      {required String phoneNumber,
      required String password,
      required String name,
      required String surname,
      required String birthDate,
      required bool gender});

  ResultFuture<TokenPair> loginUser(
      {required String phoneNumber, required String password});

  ResultFuture<TokenPair> refreshTokens({required String refreshToken});
}
