import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gym_club_mobile/core/common/widgets/background.dart';
import 'package:gym_club_mobile/core/common/widgets/custom_elevated_button.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/core/utils/core_utils.dart';
import 'package:gym_club_mobile/src/auth/presentation/bloc/auth_bloc.dart';
import 'package:gym_club_mobile/src/auth/presentation/views/register_screen.dart';
import 'package:gym_club_mobile/src/auth/presentation/widgets/login_form.dart';
import 'package:gym_club_mobile/src/dashboard/presentation/views/dashboard.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (_, state) {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is UserLoggedIn) {
            context.read<AuthBloc>().add(
                  SetTokensEvent(
                    accessToken: state.tokenPair.accessToken,
                    refreshToken: state.tokenPair.refreshToken,
                  ),
                );
            context.userProvider.initUser(state.tokenPair.accessToken);
            Navigator.pushReplacementNamed(context, Dashboard.routeName);
          }
        },
        builder: (context, state) {
          return Background(
            child: SafeArea(
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  children: [
                    Center(
                      child: Text(
                        AppLocalizations.of(context)!.authLoginTitle,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    LoginForm(
                      phoneNumberController: phoneNumberController,
                      passwordController: passwordController,
                      formKey: formKey,
                    ),
                    const SizedBox(height: 10),
                    if (state is AuthLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      CustomElevatedButton(
                        label: AppLocalizations.of(context)!.authButtonSignIn,
                        onPressed: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  LoginUserEvent(
                                    phoneNumber:
                                        phoneNumberController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          }
                        },
                      ),
                    TextButton(
                      child:
                          Text(AppLocalizations.of(context)!.authButtonSignUp),
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RegisterScreen.routeName,
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
