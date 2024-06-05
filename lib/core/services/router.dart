import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_club_mobile/core/common/views/page_under_construction.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/core/services/injection_container.dart';
import 'package:gym_club_mobile/core/utils/constants.dart';
import 'package:gym_club_mobile/src/auth/data/models/token_pair_model.dart';
import 'package:gym_club_mobile/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym_club_mobile/src/auth/presentation/views/login_screen.dart';
import 'package:gym_club_mobile/src/auth/presentation/views/register_screen.dart';
import 'package:gym_club_mobile/src/dashboard/presentation/views/dashboard.dart';
import 'package:gym_club_mobile/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:gym_club_mobile/src/on_boarding/presentation/views/on_boarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'router.main.dart';
