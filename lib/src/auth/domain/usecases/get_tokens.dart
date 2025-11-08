import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class GetTokens {
  const GetTokens(this._repository);

  final AuthRepository _repository;

  ResultFuture<TokenPair> call() => _repository.getTokens();
}
