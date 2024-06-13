import 'package:flutter/material.dart';
import 'package:gym_club_mobile/src/profile/data/models/user_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserProvider extends ChangeNotifier {
  int? _id;
  String? _accessToken;

  UserModel? _user;

  int? get userId => _id;
  String? get accessToken => _accessToken;

  UserModel? get user => _user;

  set user(UserModel? user) {
    if (user != null && _user != user) {
      _user = user;

      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  void initAuth(String? accessToken) {
    if (_accessToken != accessToken && accessToken != null) {
      _accessToken = accessToken;

      final decodedToken = JwtDecoder.decode(accessToken);
      _id = int.parse(decodedToken['nameid'].toString());

      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  void initUser(UserModel? user) {
    if (user != null && _user != user) {
      _user = user;

      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
