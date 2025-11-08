import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/profile/domain/repositories/user_repository.dart';

class DeleteUser {
  const DeleteUser(this._repository);

  final UserRepository _repository;

  ResultFuture<void> call(DeleteUserParams params) async {
    final result = await _repository.delete(
      id: params.id,
      accessToken: params.accessToken,
    );

    return result;
  }
}

class DeleteUserParams extends Equatable {
  const DeleteUserParams({required this.id, required this.accessToken});

  final int id;
  final String accessToken;

  @override
  List<Object?> get props => [id];
}
