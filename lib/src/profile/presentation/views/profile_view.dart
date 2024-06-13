import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_club_mobile/core/common/app/providers/user_provider.dart';
import 'package:gym_club_mobile/core/common/views/loading_view.dart';
import 'package:gym_club_mobile/core/common/widgets/background.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/core/services/injection_container.dart';
import 'package:gym_club_mobile/core/utils/core_utils.dart';
import 'package:gym_club_mobile/src/profile/data/models/user_model.dart';
import 'package:gym_club_mobile/src/profile/presentation/bloc/user_bloc.dart';
import 'package:gym_club_mobile/src/profile/presentation/widgets/profile_app_bar.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (_, state) {
        if (state is UserError) {
          CoreUtils.showSnackBar(context, state.message);
        } else if (state is UserFetched) {
          context.userProvider.initUser(state.user as UserModel);
        } else if (state is UserInfoChanged) {
          print('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: BlocProvider(
              create: (_) => sl<UserBloc>(),
              child: const ProfileAppBar(),
            ),
          ),
          extendBodyBehindAppBar: true,
          body: Background(
            child: ListView(
              children: [
                if (state is! UserFetched)
                  const LoadingView()
                else
                  Consumer<UserProvider>(
                    builder: (_, provider, __) {
                      final user = provider.user;
                      return Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                children: [
                                  Text(
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 32,
                                    ),
                                    '${user!.name} ${user.surname}',
                                  ),
                                  Icon(
                                    user.gender == true
                                        ? Icons.male
                                        : Icons.female,
                                    size: 32,
                                  ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                user.phoneNumber,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                DateFormat.yMMMd(
                                  Localizations.localeOf(context).languageCode,
                                ).format(
                                  DateTime.parse(user.birthDate),
                                ),
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
