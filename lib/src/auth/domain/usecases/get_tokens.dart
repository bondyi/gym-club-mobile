import 'package:gym_club_mobile/core/usecases/usecases.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class GetTokens extends UsecaseWithoutParams<void> {
  const GetTokens(this._repository);

  final AuthRepository _repository;

  @override
  ResultFuture<void> call() async => _repository.getTokens();
}
