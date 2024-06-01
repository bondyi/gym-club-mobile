import 'package:get_it/get_it.dart';
import 'package:gym_club_mobile/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:gym_club_mobile/src/auth/data/repositories/auth_repository_impl.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/login_user.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/refresh_tokens.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/register_user.dart';
import 'package:gym_club_mobile/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym_club_mobile/src/on_boarding/data/datasources/on_boarding_local_data_source.dart';
import 'package:gym_club_mobile/src/on_boarding/data/repositories/on_boarding_repository_impl.dart';
import 'package:gym_club_mobile/src/on_boarding/domain/repositories/on_boarding_repository.dart';
import 'package:gym_club_mobile/src/on_boarding/domain/usecases/cache_first_timer.dart';
import 'package:gym_club_mobile/src/on_boarding/domain/usecases/check_if_user_is_first_timer.dart';
import 'package:gym_club_mobile/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  final preferences = await SharedPreferences.getInstance();

  // Feature --> OnBoarding
  // Business logic
  sl
    ..registerFactory(
      () =>
          OnBoardingCubit(cacheFirstTimer: sl(), checkIfUserIsFirstTimer: sl()),
    )

    //Use cases
    ..registerLazySingleton(() => CacheFirstTimer(sl()))
    ..registerLazySingleton(() => CheckIfUserIsFirstTimer(sl()))

    //Repositories
    ..registerLazySingleton<OnBoardingRepository>(
      () => OnBoardingRepositoryImpl(sl()),
    )

    //Data sources
    ..registerLazySingleton<OnBoardingLocalDataSource>(
      () => OnBoardingLocalDataSourceImpl(sl()),
    )

    //External dependencies
    ..registerLazySingleton(() => preferences)

    // Feature --> Auth
    // Business logic
    ..registerFactory(
      () => AuthBloc(registerUser: sl(), loginUser: sl(), refreshTokens: sl()),
    )

    //Use cases
    ..registerLazySingleton(() => RegisterUser(sl()))
    ..registerLazySingleton(() => LoginUser(sl()))
    ..registerLazySingleton(() => RefreshTokens(sl()))

    //Repositories
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))

    //Data sources
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(sl()),
    )

    //External dependencies
    ..registerLazySingleton(http.Client.new);
}
