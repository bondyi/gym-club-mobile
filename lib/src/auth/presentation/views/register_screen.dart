import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_club_mobile/core/common/widgets/background.dart';
import 'package:gym_club_mobile/core/common/widgets/custom_elevated_button.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/core/utils/core_utils.dart';
import 'package:gym_club_mobile/l10n/app_localizations.dart';
import 'package:gym_club_mobile/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym_club_mobile/src/auth/presentation/views/login_screen.dart';
import 'package:gym_club_mobile/src/auth/presentation/widgets/register_form.dart';
import 'package:gym_club_mobile/src/dashboard/presentation/views/dashboard.dart';
import 'package:gym_club_mobile/src/profile/domain/entities/user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  static const routeName = '/register';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final nameController = TextEditingController();
  final surnameController = TextEditingController();
  final birthDateController = TextEditingController();
  Gender gender = Gender.male;
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    nameController.dispose();
    surnameController.dispose();
    birthDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) async {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is UserRegistered) {
            context.read<AuthBloc>().add(
                  LoginUserEvent(
                    phoneNumber: phoneNumberController.text.trim(),
                    password: passwordController.text.trim(),
                  ),
                );
          } else if (state is UserLoggedIn) {
            context.read<AuthBloc>().add(
                  SetTokensEvent(
                    accessToken: state.tokenPair.accessToken,
                    refreshToken: state.tokenPair.refreshToken,
                  ),
                );
            context.userProvider.initAuth(state.tokenPair.accessToken);
            await Navigator.pushReplacementNamed(context, Dashboard.routeName);
          }
        },
        builder: (context, state) {
          return Background(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.authRegisterTitle,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  RegisterForm(
                    phoneNumberController: phoneNumberController,
                    passwordController: passwordController,
                    confirmPasswordController: confirmPasswordController,
                    nameController: nameController,
                    surnameController: surnameController,
                    birthDateController: birthDateController,
                    formKey: formKey,
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            AppLocalizations.of(context)!.genderMale,
                          ),
                          leading: RadioGroup(
                            onChanged: (Gender? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            child: const Radio(value: Gender.male),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            AppLocalizations.of(context)!.genderFemale,
                          ),
                          leading: RadioGroup(
                            onChanged: (Gender? value) {
                              setState(() {
                                gender = value!;
                              });
                            },
                            child: const Radio(value: Gender.female),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (state is AuthLoading)
                    const Center(child: CircularProgressIndicator())
                  else
                    CustomElevatedButton(
                      label: AppLocalizations.of(context)!.authButtonSignUp,
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if (formKey.currentState!.validate()) {
                          context.read<AuthBloc>().add(
                                RegisterUserEvent(
                                  phoneNumber:
                                      phoneNumberController.text.trim(),
                                  password: passwordController.text.trim(),
                                  name: nameController.text.trim(),
                                  surname: surnameController.text.trim(),
                                  birthDate: birthDateController.text.trim(),
                                  gender: gender.value,
                                ),
                              );
                        }
                      },
                    ),
                  const SizedBox(height: 10),
                  TextButton(
                    child: Text(AppLocalizations.of(context)!.authButtonSignIn),
                    onPressed: () async {
                      await Navigator.pushReplacementNamed(
                        context,
                        LoginScreen.routeName,
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
