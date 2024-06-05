import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gym_club_mobile/core/common/widgets/custom_text_field.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    required this.phoneNumberController,
    required this.passwordController,
    required this.formKey,
    super.key,
  });

  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: widget.phoneNumberController,
            hintText: AppLocalizations.of(context)?.authTextFieldPhoneNumber,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 10),
          CustomTextField(
            controller: widget.passwordController,
            hintText: AppLocalizations.of(context)?.authTextFieldPassword,
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                obscurePassword = !obscurePassword;
              }),
              icon: Icon(
                obscurePassword ? Icons.visibility : Icons.visibility_off,
                color: context.theme.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
