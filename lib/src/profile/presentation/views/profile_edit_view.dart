import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_club_mobile/core/common/widgets/background.dart';
import 'package:gym_club_mobile/core/common/widgets/custom_elevated_button.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/core/utils/core_utils.dart';
import 'package:gym_club_mobile/l10n/app_localizations.dart';
import 'package:gym_club_mobile/src/profile/data/models/user_model.dart';
import 'package:gym_club_mobile/src/profile/domain/entities/user.dart';
import 'package:gym_club_mobile/src/profile/presentation/bloc/user_bloc.dart';
import 'package:gym_club_mobile/src/profile/presentation/widgets/edit_form.dart';

class ProfileEditView extends StatefulWidget {
  const ProfileEditView({super.key});

  @override
  State<ProfileEditView> createState() => _ProfileEditViewState();
}

class _ProfileEditViewState extends State<ProfileEditView> {
  final phoneNumberController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final birthDateController = TextEditingController();
  Gender gender = Gender.male;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    nameController.dispose();
    surnameController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    phoneNumberController.text = context.user!.phoneNumber;
    nameController.text = context.user!.name;
    surnameController.text = context.user!.surname;
    birthDateController.text = context.user!.birthDate;
    gender = context.user!.gender ? Gender.male : Gender.female;
  }

  @override
  Widget build(BuildContext context) {
    return Background(
      child: BlocConsumer<UserBloc, UserState>(
        listener: (_, state) {
          if (state is UserError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is UserInfoChanged) {
            context.userProvider.user = state.user as UserModel;
            context.pop();
          } else if (state is UserDeleted) {
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
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () => context.pop(),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
            body: Background(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.profilePopupItemTitleEdit,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    EditForm(
                      phoneNumberController: phoneNumberController,
                      nameController: nameController,
                      surnameController: surnameController,
                      birthDateController: birthDateController,
                      formKey: formKey,
                    ),
                    const SizedBox(height: 10),
                    RadioGroup<Gender>(
                      groupValue: gender,
                      onChanged: (Gender? value) {
                        setState(() {
                          gender = value!;
                        });
                      },
                      child: const Column(
                        children: [
                          Radio<Gender>(
                            value: Gender.male,
                          ),
                          Radio<Gender>(value: Gender.female),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (state is UserLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      CustomElevatedButton(
                        label: AppLocalizations.of(context)!.editButtonSave,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formKey.currentState!.validate()) {
                            context.read<UserBloc>().add(
                                  PutUserEvent(
                                    user: UserModel(
                                      userId: context.userId!,
                                      userRole: context.user!.userRole,
                                      phoneNumber: phoneNumberController.text,
                                      name: nameController.text,
                                      surname: surnameController.text,
                                      birthDate: birthDateController.text,
                                      gender: gender.value,
                                    ),
                                    accessToken: context.accessToken!,
                                  ),
                                );
                          }
                        },
                      ),
                    const SizedBox(height: 10),
                    TextButton(
                      child: Text(
                        AppLocalizations.of(context)!.buttonDelete,
                        style: const TextStyle(color: Colors.red),
                      ),
                      onPressed: () {
                        context.read<UserBloc>().add(
                              DeleteUserEvent(
                                id: context.userId!,
                                accessToken: context.accessToken!,
                              ),
                            );
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
