import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/profile/domain/entities/user.dart';
import 'package:gym_club_mobile/src/profile/domain/repositories/user_repository.dart';

class GetUser {
  const GetUser(this._repository);

  final UserRepository _repository;

  ResultFuture<User> call(GetUserParams params) async {
    final result = await _repository.getById(
      id: params.id,
      accessToken: params.accessToken,
    );

    return result;
  }
}

class GetUserParams extends Equatable {
  const GetUserParams({required this.id, required this.accessToken});

  final int id;
  final String accessToken;

  @override
  List<Object?> get props => [id];
}
