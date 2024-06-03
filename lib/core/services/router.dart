import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_club_mobile/core/common/views/page_under_construction.dart';
import 'package:gym_club_mobile/core/services/injection_container.dart';
import 'package:gym_club_mobile/src/auth/data/datasources/auth_local_data_source.dart';
import 'package:gym_club_mobile/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym_club_mobile/src/auth/presentation/views/login_screen.dart';
import 'package:gym_club_mobile/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:gym_club_mobile/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:gym_club_mobile/src/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final preferences = sl<SharedPreferences>();
      return _pageRouteBuilder(
        (_) {
          if (preferences.getBool(kFirstTimerKey) ?? true) {
            return BlocProvider(
              create: (_) => sl<OnBoardingCubit>(),
              child: const OnBoardingScreen(),
            );
          } else if (preferences.getString(kAccessTokenKey) != null) {
            // TODO(Routes): implement BlocProvider for Dashboard feature
          }
          return BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const LoginScreen(),
          );
        },
        settings: settings,
      );
    default:
      return _pageRouteBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageRouteBuilder(
  Widget Function(BuildContext) page, {
  required RouteSettings settings,
}) {
  return PageRouteBuilder(
    settings: settings,
    transitionsBuilder: (_, animation, __, child) => FadeTransition(
      opacity: animation,
      child: child,
    ),
    pageBuilder: (context, _, __) => page(context),
  );
}
