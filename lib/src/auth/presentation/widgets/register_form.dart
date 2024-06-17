import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gym_club_mobile/core/common/widgets/custom_text_form_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({
    required this.phoneNumberController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.nameController,
    required this.surnameController,
    required this.birthDateController,
    required this.formKey,
    super.key,
  });

  final TextEditingController phoneNumberController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController birthDateController;
  final GlobalKey<FormState> formKey;

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextFormField(
            controller: widget.phoneNumberController,
            hintText: AppLocalizations.of(context)!.phoneNumber,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: widget.passwordController,
            hintText: AppLocalizations.of(context)!.password,
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () => setState(() {
                obscurePassword = !obscurePassword;
              }),
              icon: Icon(
                obscurePassword ? Icons.visibility : Icons.visibility_off,
              ),
            ),
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: widget.confirmPasswordController,
            hintText: AppLocalizations.of(context)!.confirmPassword,
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            validator: (value) {
              if (value != widget.passwordController.text) {
                return AppLocalizations.of(context)!
                    .textFormFieldValidatorPasswordMismatch;
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: widget.nameController,
            hintText: AppLocalizations.of(context)!.name,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: widget.surnameController,
            hintText: AppLocalizations.of(context)!.surname,
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 10),
          CustomTextFormField(
            controller: widget.birthDateController,
            hintText: AppLocalizations.of(context)!.birthDate,
            readOnly: true,
            onTap: _selectDate,
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Future<void> _selectDate() async {
    final currentDate = DateTime.now();

    final pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(currentDate.year - 100),
      lastDate: DateTime(currentDate.year - 14),
    );

    if (pickedDate != null) {
      setState(() {
        widget.birthDateController.text = pickedDate.toString().split(' ')[0];
      });
    }
  }
}
