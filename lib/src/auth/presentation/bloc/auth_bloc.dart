import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/user.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/login_user.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/refresh_tokens.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/register_user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required RegisterUser registerUser,
    required LoginUser loginUser,
    required RefreshTokens refreshTokens,
}) :
        _registerUser = registerUser,
        _loginUser = loginUser,
        _refreshTokens = refreshTokens,
        super(const AuthInitial()) {
    on<RegisterUserEvent>(_registerUserHandler);
    on<LoginUserEvent>(_loginUserHandler);
    on<RefreshTokensEvent>(_refreshTokensHandler);
  }

  final RegisterUser _registerUser;
  final LoginUser _loginUser;
  final RefreshTokens _refreshTokens;

  Future<void> _registerUserHandler(
      RegisterUserEvent event,
      Emitter<AuthState> emit
      ) async {
    emit(const RegisteringUser());

    final result = await _registerUser(RegisterUserParams(
        phoneNumber: event.phoneNumber,
        password: event.password,
        name: event.name,
        surname: event.surname,
        birthDate: event.birthDate,
        gender: event.gender
    ));

    result.fold(
            (failure) => emit(AuthError(failure.errorMessage)),
            (_) => emit(const UserRegistered()));
  }

  Future<void> _loginUserHandler(
      LoginUserEvent event,
      Emitter<AuthState> emit
      ) async {
    emit(const AuthenticatingUser());

    final result = await _loginUser(LoginUserParams(
        phoneNumber: event.phoneNumber,
        password: event.password
    ));

    result.fold(
            (failure) => emit(AuthError(failure.errorMessage)),
            (tokenPair) => emit(UserAuthenticated(tokenPair)));
  }

  Future<void> _refreshTokensHandler(
      RefreshTokensEvent event,
      Emitter<AuthState> emit
      ) async {
    emit(const RefreshingTokens());

    final result = await _refreshTokens(RefreshTokensParams(
        refreshToken: event.refreshToken
    ));

    result.fold(
            (failure) => emit(AuthError(failure.errorMessage)),
            (tokenPair) => emit(TokensRefreshed(tokenPair)));
  }
}
