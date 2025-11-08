import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class LoginUser {
  const LoginUser(this._repository);

  final AuthRepository _repository;

  ResultFuture<TokenPair> call(LoginUserParams params) async {
    final result = await _repository.loginUser(
      phoneNumber: params.phoneNumber,
      password: params.password,
    );

    return result;
  }
}

class LoginUserParams extends Equatable {
  const LoginUserParams({required this.phoneNumber, required this.password});

  final String phoneNumber;
  final String password;

  @override
  List<Object?> get props => [phoneNumber, password];
}
