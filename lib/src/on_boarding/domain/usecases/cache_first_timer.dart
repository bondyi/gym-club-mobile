import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/on_boarding/domain/repositories/on_boarding_repository.dart';

class CacheFirstTimer {
  const CacheFirstTimer(this._repository);

  final OnBoardingRepository _repository;

  ResultFuture<void> call() async => _repository.cacheFirstTimer();
}
