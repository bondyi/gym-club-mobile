part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthError extends AuthState {
  const AuthError(this.message);

  final String message;

  @override
  List<String> get props => [message];
}

class UserRegistered extends AuthState {
  const UserRegistered();
}

class UserLoggedIn extends AuthState {
  const UserLoggedIn(this.tokenPair);

  final TokenPair tokenPair;

  @override
  List<TokenPair> get props => [tokenPair];
}

class TokensRefreshed extends AuthState {
  const TokensRefreshed(this.tokenPair);

  final TokenPair tokenPair;

  @override
  List<TokenPair> get props => [tokenPair];
}

class TokensReceivedLocal extends AuthState {
  const TokensReceivedLocal(this.tokenPair);

  final TokenPair tokenPair;

  @override
  List<TokenPair> get props => [tokenPair];
}

class TokensSavedLocal extends AuthState {
  const TokensSavedLocal();
}
