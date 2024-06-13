import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/core/usecases/usecases.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/profile/domain/entities/user.dart';
import 'package:gym_club_mobile/src/profile/domain/repositories/user_repository.dart';

class PutUser extends UsecaseWithParams<User, PutUserParams> {
  const PutUser(this._repository);

  final UserRepository _repository;

  @override
  ResultFuture<User> call(PutUserParams params) async {
    final result = await _repository.put(
      user: params.user,
      accessToken: params.accessToken,
    );

    return result;
  }
}

class PutUserParams extends Equatable {
  const PutUserParams({required this.user, required this.accessToken});

  final User user;
  final String accessToken;

  @override
  List<Object?> get props => [user, accessToken];
}
