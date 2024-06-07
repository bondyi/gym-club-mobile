import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class UserProvider extends ChangeNotifier {
  String? _accessToken;
  int? _userId;
  String? _userRole;

  String? get accessToken => _accessToken;
  int? get userId => _userId;
  String? get userRole => _userRole;

  void initUser(String? accessToken) {
    if (accessToken != null && _accessToken != accessToken) {
      _accessToken = accessToken;

      final decodedToken = JwtDecoder.decode(accessToken);
      _userId = int.parse(decodedToken['nameid'].toString());
      _userRole = decodedToken['role'].toString();
    }
  }

  set accessToken(String? accessToken) {
    if (_accessToken != accessToken) {
      _accessToken = accessToken;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
