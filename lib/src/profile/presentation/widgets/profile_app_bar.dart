import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gym_club_mobile/core/common/widgets/popup_item.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/core/services/injection_container.dart';
import 'package:gym_club_mobile/core/utils/core_utils.dart';
import 'package:gym_club_mobile/src/profile/data/models/user_model.dart';
import 'package:gym_club_mobile/src/profile/presentation/bloc/user_bloc.dart';
import 'package:gym_club_mobile/src/profile/presentation/views/profile_edit_view.dart';

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        AppLocalizations.of(context)!.dashboardTabItemTitleProfile,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 24,
        ),
      ),
      actions: [
        BlocConsumer<UserBloc, UserState>(
          listener: (_, state) {
            if (state is UserError) {
              CoreUtils.showSnackBar(context, state.message);
            } else if (state is UserInfoChanged) {
              context.userProvider.user = state.user as UserModel;
            } else if (state is UserLoggedOut) {
              unawaited(
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/',
                  (route) => false,
                ),
              );
            }
          },
          builder: (context, state) {
            return PopupMenuButton(
              offset: const Offset(0, 50),
              itemBuilder: (_) => [
                PopupMenuItem<void>(
                  child: PopupItem(
                    title:
                        AppLocalizations.of(context)!.profilePopupItemTitleEdit,
                    icon: const Icon(Icons.edit_outlined),
                  ),
                  onTap: () => context.push(
                    BlocProvider(
                      create: (_) => sl<UserBloc>(),
                      child: const ProfileEditView(),
                    ),
                  ),
                ),
                PopupMenuItem<void>(
                  child: PopupItem(
                    title: AppLocalizations.of(context)!
                        .profilePopupItemTitleLogout,
                    icon: const Icon(Icons.logout_outlined),
                  ),
                  onTap: () {
                    context.read<UserBloc>().add(const LogoutUserEvent());
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
