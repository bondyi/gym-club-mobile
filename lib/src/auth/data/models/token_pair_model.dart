import 'dart:convert';

import 'package:gym_club_mobile/core/utils/typedef.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';

class TokenPairModel extends TokenPair {
  const TokenPairModel({
    required super.accessToken,
    required super.refreshToken,
  });

  TokenPairModel.fromMap(DataMap map)
      : this(
          accessToken: map['accessToken'] as String,
          refreshToken: map['refreshToken'] as String,
        );

  factory TokenPairModel.fromJson(String source) =>
      TokenPairModel.fromMap(jsonDecode(source) as DataMap);

  DataMap toMap() => {'accessToken': accessToken, 'refreshToken': refreshToken};

  String toJson() => jsonEncode(toMap());

  TokenPairModel copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return TokenPairModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
