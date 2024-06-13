import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/get_tokens.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/login_user.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/refresh_tokens.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/register_user.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/set_tokens.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required RegisterUser registerUser,
    required LoginUser loginUser,
    required RefreshTokens refreshTokens,
    required GetTokens getTokens,
    required SetTokens setTokens,
  })  : _registerUser = registerUser,
        _loginUser = loginUser,
        _refreshTokens = refreshTokens,
        _getTokens = getTokens,
        _setTokens = setTokens,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<RegisterUserEvent>(_registerUserHandler);
    on<LoginUserEvent>(_loginUserHandler);
    on<RefreshTokensEvent>(_refreshTokensHandler);
    on<GetTokensEvent>(_getTokensHandler);
    on<SetTokensEvent>(_setTokensHandler);
  }

  final RegisterUser _registerUser;
  final LoginUser _loginUser;
  final RefreshTokens _refreshTokens;
  final GetTokens _getTokens;
  final SetTokens _setTokens;

  Future<void> _registerUserHandler(
    RegisterUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _registerUser(
      RegisterUserParams(
        phoneNumber: event.phoneNumber,
        password: event.password,
        name: event.name,
        surname: event.surname,
        birthDate: event.birthDate,
        gender: event.gender,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (_) => emit(const UserRegistered()),
    );
  }

  Future<void> _loginUserHandler(
    LoginUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await _loginUser(
      LoginUserParams(
        phoneNumber: event.phoneNumber,
        password: event.password,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (tokenPair) => emit(UserLoggedIn(tokenPair)),
    );
  }

  Future<void> _refreshTokensHandler(
    RefreshTokensEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _refreshTokens(
      RefreshTokensParams(
        refreshToken: event.refreshToken,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (tokenPair) => emit(TokensRefreshed(tokenPair)),
    );
  }

  Future<void> _getTokensHandler(
    GetTokensEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _getTokens();

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (tokenPair) => emit(TokensReceivedLocal(tokenPair)),
    );
  }

  Future<void> _setTokensHandler(
    SetTokensEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _setTokens(
      SetTokensParams(
        accessToken: event.accessToken,
        refreshToken: event.refreshToken,
      ),
    );

    result.fold(
      (failure) => emit(AuthError(failure.errorMessage)),
      (tokenPair) => emit(const TokensSavedLocal()),
    );
  }
}
