part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

class RegisteringUser extends AuthState {
  const RegisteringUser();
}

class UserRegistered extends AuthState {
  const UserRegistered();
}

class AuthenticatingUser extends AuthState {
  const AuthenticatingUser();
}

class UserAuthenticated extends AuthState {
  const UserAuthenticated(this.tokenPair);

  final TokenPair tokenPair;

  @override
  List<TokenPair> get props => [tokenPair];

}

class RefreshingTokens extends AuthState {
  const RefreshingTokens();
}

class TokensRefreshed extends AuthState {
  const TokensRefreshed(this.tokenPair);

  final TokenPair tokenPair;

  @override
  List<TokenPair> get props => [tokenPair];
}

class LoadingUserInfo extends AuthState {
  const LoadingUserInfo();
}

class UserInfoLoaded extends AuthState {
  const UserInfoLoaded(this.userInfo);

  final User userInfo;

  @override
  List<User> get props => [userInfo];
}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}
