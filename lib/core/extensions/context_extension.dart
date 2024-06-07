import 'package:flutter/material.dart';
import 'package:gym_club_mobile/core/common/app/providers/user_provider.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;
  double get height => size.height;

  UserProvider get userProvider => read<UserProvider>();

  String? get accessToken => userProvider.accessToken;
}
