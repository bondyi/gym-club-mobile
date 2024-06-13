import 'dart:convert';

import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/profile/domain/entities/user.dart';

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
          userId: map['userId'] as int,
          userRole: map['userRole'] as String,
          phoneNumber: map['phoneNumber'] as String,
          name: map['name'] as String,
          surname: map['surname'] as String,
          birthDate: map['birthDate'] as String,
          gender: map['gender'] as bool,
        );

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  DataMap toMap() => {
        'userId': userId,
        'userRole': userRole,
        'phoneNumber': phoneNumber,
        'name': name,
        'surname': surname,
        'birthDate': birthDate,
        'gender': gender,
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
