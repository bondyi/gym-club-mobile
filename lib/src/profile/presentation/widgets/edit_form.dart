import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gym_club_mobile/core/common/widgets/custom_text_form_field.dart';

class EditForm extends StatefulWidget {
  const EditForm({
    required this.phoneNumberController,
    required this.nameController,
    required this.surnameController,
    required this.birthDateController,
    required this.formKey,
    super.key,
  });

  final TextEditingController phoneNumberController;
  final TextEditingController nameController;
  final TextEditingController surnameController;
  final TextEditingController birthDateController;
  final GlobalKey<FormState> formKey;

  @override
  State<EditForm> createState() => _EditFormState();
}

class _EditFormState extends State<EditForm> {
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
