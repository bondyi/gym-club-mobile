import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class SetTokens {
  const SetTokens(this._repository);

  final AuthRepository _repository;

  ResultFuture<void> call(SetTokensParams params) async =>
      _repository.setTokens(
        accessToken: params.accessToken,
        refreshToken: params.refreshToken,
      );
}

class SetTokensParams extends Equatable {
  const SetTokensParams({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;

  @override
  List<Object?> get props => [accessToken, refreshToken];
}
