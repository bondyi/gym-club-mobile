import 'package:get_it/get_it.dart';
import 'package:gym_club_mobile/src/auth/data/datasources/auth_local_data_source.dart';
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

part 'injection_container.main.dart';
