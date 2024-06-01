import 'dart:convert';

import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.userId,
    required super.userRole,
    required super.phoneNumber,
    required super.name,
    required super.surname,
    required super.birthDate,
    required super.gender,
  });

  UserModel.fromMap(DataMap map)
      : this(
          userId: map['UserId'] as int,
          userRole: map['UserRole'] as String,
          phoneNumber: map['PhoneNumber'] as String,
          name: map['Name'] as String,
          surname: map['Surname'] as String,
          birthDate: map['BirthDate'] as String,
          gender: map['Gender'] as bool,
        );

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  DataMap toMap() => {
        'UserId': userId,
        'UserRole': userRole,
        'PhoneNumber': phoneNumber,
        'Name': name,
        'Surname': surname,
        'BirthDate': birthDate,
        'Gender': gender,
      };

  String toJson() => jsonEncode(toMap());

  UserModel copyWith({
    int? userId,
    String? userRole,
    String? phoneNumber,
    String? name,
    String? surname,
    String? birthDate,
    bool? gender,
  }) {
    return UserModel(
      userId: userId ?? this.userId,
      userRole: userRole ?? this.userRole,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      birthDate: birthDate ?? this.birthDate,
      gender: gender ?? this.gender,
    );
  }
}
