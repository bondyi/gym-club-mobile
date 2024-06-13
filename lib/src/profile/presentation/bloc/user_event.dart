part of 'user_bloc.dart';

sealed class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object?> get props => [];
}

class GetUserEvent extends UserEvent {
  const GetUserEvent({required this.id, required this.accessToken});

  final int id;
  final String accessToken;

  @override
  List<Object?> get props => [id];
}

class PutUserEvent extends UserEvent {
  const PutUserEvent({required this.user, required this.accessToken});

  final User user;
  final String accessToken;

  @override
  List<Object?> get props => [user, accessToken];
}

class DeleteUserEvent extends UserEvent {
  const DeleteUserEvent({required this.id, required this.accessToken});

  final int id;
  final String accessToken;

  @override
  List<Object?> get props => [id];
}

class LogoutUserEvent extends UserEvent {
  const LogoutUserEvent();
}
