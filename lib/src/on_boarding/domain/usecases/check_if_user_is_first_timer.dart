import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/on_boarding/domain/repositories/on_boarding_repository.dart';

class CheckIfUserIsFirstTimer {
  const CheckIfUserIsFirstTimer(this._repository);

  final OnBoardingRepository _repository;

  ResultFuture<bool> call() async => _repository.checkIfUserIsFirstTimer();
}
