import 'package:gym_club_mobile/core/utils/typedef.dart';

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();
  ResultFuture call();
}

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultFuture<Type> call(Params params);
}
