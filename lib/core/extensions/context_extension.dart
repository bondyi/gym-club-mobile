import 'package:flutter/material.dart';
import 'package:gym_club_mobile/core/common/app/providers/tab_navigator.dart';
import 'package:gym_club_mobile/core/common/app/providers/user_provider.dart';
import 'package:gym_club_mobile/src/profile/data/models/user_model.dart';
import 'package:provider/provider.dart';

extension ContextExtension on BuildContext {
  ThemeData get theme => Theme.of(this);

  MediaQueryData get mediaQuery => MediaQuery.of(this);

  Size get size => mediaQuery.size;

  double get width => size.width;

  double get height => size.height;

  UserProvider get userProvider => read<UserProvider>();

  int? get userId => userProvider.userId;

  String? get accessToken => userProvider.accessToken;

  UserModel? get user => userProvider.user;

  TabNavigator get tabNavigator => read<TabNavigator>();

  void pop() => tabNavigator.pop();

  void push(Widget page) => tabNavigator.push(TabItem(child: page));
}
