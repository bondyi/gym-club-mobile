part of 'router.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      final preferences = sl<SharedPreferences>();

      return _pageBuilder(
        (context) {
          if (preferences.getBool(spFirstTimerKey) ?? true) {
            return BlocProvider(
              create: (_) => sl<OnBoardingCubit>(),
              child: const OnBoardingScreen(),
            );
          }

          final accessToken = preferences.getString(spAccessTokenKey);
          final refreshToken = preferences.getString(spRefreshTokenKey);

          if (accessToken != null && refreshToken != null) {
            final tokenPair = TokenPairModel(
              accessToken: accessToken,
              refreshToken: refreshToken,
            );

            context.tokenPairProvider.initTokenPair(tokenPair);

            return const Dashboard();
          }

          return BlocProvider(
            create: (_) => sl<AuthBloc>(),
            child: const LoginScreen(),
          );
        },
        settings: settings,
      );
    case LoginScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const LoginScreen(),
        ),
        settings: settings,
      );
    case RegisterScreen.routeName:
      return _pageBuilder(
        (_) => BlocProvider(
          create: (_) => sl<AuthBloc>(),
          child: const RegisterScreen(),
        ),
        settings: settings,
      );
    case Dashboard.routeName:
      return _pageBuilder(
        (_) => const Dashboard(),
        settings: settings,
      );
    default:
      return _pageBuilder(
        (_) => const PageUnderConstruction(),
        settings: settings,
      );
  }
}

PageRouteBuilder<dynamic> _pageBuilder(
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
