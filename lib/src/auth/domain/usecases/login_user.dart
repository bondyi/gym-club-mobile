import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/core/usecases/usecases.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class LoginUser extends UsecaseWithParams<TokenPair, LoginUserParams> {
  const LoginUser(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<TokenPair> call(LoginUserParams params) async => _repository
      .loginUser(phoneNumber: params.phoneNumber, password: params.password);
}

class LoginUserParams extends Equatable {
  const LoginUserParams({required this.phoneNumber, required this.password});

  final String phoneNumber;
  final String password;

  @override
  List<Object?> get props => [phoneNumber, password];
}
