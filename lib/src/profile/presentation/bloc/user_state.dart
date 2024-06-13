part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

final class UserInitial extends UserState {
  const UserInitial();
}

final class UserLoading extends UserState {
  const UserLoading();
}

class UserError extends UserState {
  const UserError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}

class UserFetched extends UserState {
  const UserFetched(this.user);

  final User user;

  @override
  List<User> get props => [user];
}

class UserInfoChanged extends UserState {
  const UserInfoChanged(this.user);

  final User user;

  @override
  List<User> get props => [user];
}

class UserDeleted extends UserState {
  const UserDeleted();
}

class UserLoggedOut extends UserState {
  const UserLoggedOut();
}
