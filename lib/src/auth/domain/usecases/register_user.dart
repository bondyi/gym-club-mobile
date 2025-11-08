import 'package:equatable/equatable.dart';
import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';

class RegisterUser {
  const RegisterUser(this._repository);

  final AuthRepository _repository;

  ResultFuture<void> call(RegisterUserParams params) async =>
      _repository.registerUser(
        phoneNumber: params.phoneNumber,
        password: params.password,
        name: params.name,
        surname: params.surname,
        birthDate: params.birthDate,
        gender: params.gender,
      );
}

class RegisterUserParams extends Equatable {
  const RegisterUserParams({
    required this.phoneNumber,
    required this.password,
    required this.name,
    required this.surname,
    required this.birthDate,
    required this.gender,
  });

  final String phoneNumber;
  final String password;
  final String name;
  final String surname;
  final String birthDate;
  final bool gender;

  @override
  List<Object?> get props =>
      [phoneNumber, password, name, surname, birthDate, gender];
}
