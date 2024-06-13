part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  await _initOnBoarding();
  await _initAuth();
  await _initUser();
}

// Feature --> OnBoarding
Future<void> _initOnBoarding() async {
  final preferences = await SharedPreferences.getInstance();

  sl
    ..registerFactory(
      () =>
          OnBoardingCubit(cacheFirstTimer: sl(), checkIfUserIsFirstTimer: sl()),
    )
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))
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
      () => AuthBloc(
        registerUser: sl(),
        loginUser: sl(),
        refreshTokens: sl(),
        getTokens: sl(),
        setTokens: sl(),
      ),
    )
    ..registerLazySingleton(() => RegisterUser(sl()))
    ..registerLazySingleton(() => LoginUser(sl()))
    ..registerLazySingleton(() => RefreshTokens(sl()))
    ..registerLazySingleton(() => GetTokens(sl()))
    ..registerLazySingleton(() => SetTokens(sl()))
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

Future<void> _initUser() async {
  sl
    ..registerFactory(
      () => UserBloc(
        getUser: sl(),
        putUser: sl(),
        deleteUser: sl(),
        logoutUser: sl(),
      ),
    )
    ..registerLazySingleton(() => GetUser(sl()))
    ..registerLazySingleton(() => PutUser(sl()))
    ..registerLazySingleton(() => DeleteUser(sl()))
    ..registerLazySingleton(() => LogoutUser(sl()))
    ..registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(sl(), sl()),
    )
    ..registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(sl()),
    );
}
