import 'package:get_it/get_it.dart';
import 'package:gym_club_mobile/src/auth/data/datasources/auth_remote_data_source.dart';
import 'package:gym_club_mobile/src/auth/data/repositories/auth_repository_impl.dart';
import 'package:gym_club_mobile/src/auth/domain/repositories/auth_repository.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/login_user.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/refresh_tokens.dart';
import 'package:gym_club_mobile/src/auth/domain/usecases/register_user.dart';
import 'package:gym_club_mobile/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  sl
    //App logic
    ..registerFactory(() => AuthBloc(registerUser: sl(), loginUser: sl(), refreshTokens: sl()))

    //Use cases
    ..registerLazySingleton(() => RegisterUser(sl()))
    ..registerLazySingleton(() => LoginUser(sl()))
    ..registerLazySingleton(() => RefreshTokens(sl()))

    //Repositories
    ..registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()))

    //Data sources
    ..registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl()))

    //External dependencies
    ..registerLazySingleton(http.Client.new);
}