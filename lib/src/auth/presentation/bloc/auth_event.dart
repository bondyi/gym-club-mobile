part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class RegisterUserEvent extends AuthEvent {
  const RegisterUserEvent({
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.gender
});

  final String phoneNumber;
  final String password;
  final String name;
  final String surname;
  final String birthDate;
  final bool gender;

  @override
  List<Object?> get props => [phoneNumber, password, name, surname, birthDate, gender];
}

class LoginUserEvent extends AuthEvent {
  const LoginUserEvent({
    required this.phoneNumber,
    required this.password
});

  final String phoneNumber;
  final String password;

  @override
  List<Object?> get props => [phoneNumber, password];
}

class RefreshTokensEvent extends AuthEvent {
  const RefreshTokensEvent({
    required this.refreshToken,
  });

  final String refreshToken;

  @override
  List<Object?> get props => [refreshToken];
}