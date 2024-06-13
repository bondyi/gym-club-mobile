import 'package:gym_club_mobile/core/usecases/usecases.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/profile/domain/repositories/user_repository.dart';

class LogoutUser extends UsecaseWithoutParams<void> {
  const LogoutUser(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<void> call() async => _repository.logoutUser();
}
