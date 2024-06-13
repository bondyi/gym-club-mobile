import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/profile/domain/entities/user.dart';

abstract class UserRepository {
  const UserRepository();

  ResultFuture<User> getById({
    required int id,
    required String accessToken,
  });

  ResultFuture<User> put({
    required User user,
    required String accessToken,
  });

  ResultFuture<void> delete({
    required int id,
    required String accessToken,
  });

  ResultFuture<void> logoutUser();
}
