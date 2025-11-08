import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_club_mobile/src/profile/domain/entities/user.dart';
import 'package:gym_club_mobile/src/profile/domain/usecases/delete_user.dart';
import 'package:gym_club_mobile/src/profile/domain/usecases/get_user.dart';
import 'package:gym_club_mobile/src/profile/domain/usecases/logout_user.dart';
import 'package:gym_club_mobile/src/profile/domain/usecases/put_user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({
    required GetUser getUser,
    required PutUser putUser,
    required DeleteUser deleteUser,
    required LogoutUser logoutUser,
  })  : _getUser = getUser,
        _putUser = putUser,
        _deleteUser = deleteUser,
        _logoutUser = logoutUser,
        super(const UserInitial()) {
    on<UserEvent>((event, emit) {
      emit(const UserLoading());
    });
    on<GetUserEvent>(_getUserHandler);
    on<PutUserEvent>(_putUserHandler);
    on<DeleteUserEvent>(_deleteUserHandler);
    on<LogoutUserEvent>(_logoutUserHandler);
  }

  final GetUser _getUser;
  final PutUser _putUser;
  final DeleteUser _deleteUser;
  final LogoutUser _logoutUser;

  Future<void> _getUserHandler(
    GetUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());

    final result = await _getUser(
      GetUserParams(id: event.id, accessToken: event.accessToken),
    );

    result.fold(
      (failure) => emit(UserError(failure.errorMessage)),
      (user) => emit(UserFetched(user)),
    );
  }

  Future<void> _putUserHandler(
    PutUserEvent event,
    Emitter<UserState> emit,
  ) async {
    emit(const UserLoading());

    final result = await _putUser(
      PutUserParams(user: event.user, accessToken: event.accessToken),
    );

    result.fold(
      (failure) => emit(UserError(failure.errorMessage)),
      (user) => emit(UserInfoChanged(user)),
    );
  }

  Future<void> _deleteUserHandler(
    DeleteUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final result = await _deleteUser(
      DeleteUserParams(id: event.id, accessToken: event.accessToken),
    );

    result.fold(
      (failure) => emit(UserError(failure.errorMessage)),
      (_) => emit(const UserLoggedOut()),
    );
  }

  Future<void> _logoutUserHandler(
    LogoutUserEvent event,
    Emitter<UserState> emit,
  ) async {
    final result = await _logoutUser();

    result.fold(
      (failure) => emit(UserError(failure.errorMessage)),
      (tokenPair) => emit(const UserLoggedOut()),
    );
  }
}
