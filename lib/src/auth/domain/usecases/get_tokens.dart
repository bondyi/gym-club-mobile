import 'package:gym_club_mobile/core/usecases/usecases.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class GetTokens extends UsecaseWithoutParams<TokenPair> {
  const GetTokens(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<TokenPair> call() async => _repository.getTokens();
}
