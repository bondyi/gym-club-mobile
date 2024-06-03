part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initOnBoarding();
  await _initAuth();
}

// Feature --> OnBoarding
Future<void> _initOnBoarding() async {
  final preferences = await SharedPreferences.getInstance();

  sl
    ..registerFactory(
      () =>
          OnBoardingCubit(cacheFirstTimer: sl(), checkIfUserIsFirstTimer: sl()),
    )
    ..registerLazySingleton(
      () => CacheFirstTimer(sl()),
    )
    ..registerLazySingleton(
      () => CheckIfUserIsFirstTimer(sl()),
    )
    ..registerLazySingleton<OnBoardingRepository>(
      () => OnBoardingRepositoryImpl(sl()),
    )
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton(() => preferences);
}

// Feature --> Auth
Future<void> _initAuth() async {
  sl
    ..registerFactory(
      () => AuthBloc(registerUser: sl(), loginUser: sl(), refreshTokens: sl()),
    )
    ..registerLazySingleton(
      () => RegisterUser(sl()),
    )
    ..registerLazySingleton(
      () => LoginUser(sl()),
    )
    ..registerLazySingleton(() => RefreshTokens(sl()))
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(sl(), sl()),
    )
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    )
    ..registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(sl()),
    )
    ..registerLazySingleton(http.Client.new);
}
