import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/core/usecases/usecases.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class RefreshTokens extends UsecaseWithParams<TokenPair, RefreshTokensParams> {
  const RefreshTokens(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<TokenPair> call(RefreshTokensParams params) async =>
      _repository.refreshTokens(refreshToken: params.refreshToken);
}

class RefreshTokensParams extends Equatable {
  const RefreshTokensParams({required this.refreshToken});

  final String refreshToken;

  @override
  List<Object?> get props => [refreshToken];
}
