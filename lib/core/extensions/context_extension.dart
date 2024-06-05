import 'package:flutter/material.dart';
import 'package:gym_club_mobile/core/common/app/providers/token_pair_provider.dart';
import 'package:gym_club_mobile/src/auth/domain/entities/token_pair.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;
  double get height => size.height;

  TokenPairProvider get tokenPairProvider => read<TokenPairProvider>();

  TokenPair? get currentTokenPair => tokenPairProvider.tokenPair;
}
