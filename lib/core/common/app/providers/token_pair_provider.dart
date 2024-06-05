import 'package:flutter/material.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';

class TokenPairProvider extends ChangeNotifier {
  TokenPair? _tokenPair;

  TokenPair? get tokenPair => _tokenPair;

  void initTokenPair(TokenPair? tokenPair) {
    if (_tokenPair != tokenPair) _tokenPair = tokenPair;
  }

  set tokenPair(TokenPair? tokenPair) {
    if (_tokenPair != tokenPair) {
      _tokenPair = tokenPair;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }
}
