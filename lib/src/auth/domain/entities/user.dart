import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User(
      {required this.userId,
      required this.userRole,
      required this.phoneNumber,
      required this.name,
      required this.surname,
      required this.birthDate,
      required this.gender});

  final int userId;
  final String userRole;
  final String phoneNumber;
  final String name;
  final String surname;
  final String birthDate;
  final bool gender;

  @override
  List<Object?> get props => [userId];
}
