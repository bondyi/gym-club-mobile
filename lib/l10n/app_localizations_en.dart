// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get onBoardingTitleFirst => 'Welcome.';

  @override
  String get onBoardingDescriptionFirst =>
      'This is a mobile application for clients and trainers of the GymClub gym.';

  @override
  String get onBoardingTitleSecond => 'Training programs.';

  @override
  String get onBoardingDescriptionSecond =>
      'Choose a suitable training program for yourself and track its progress.';

  @override
  String get onBoardingTitleThird => 'Classes with trainers.';

  @override
  String get onBoardingDescriptionThird =>
      'Sign up for group classes with trainers.';

  @override
  String get onBoardingButtonGetStarted => 'Get started';

  @override
  String get authLoginTitle => 'Login';

  @override
  String get authRegisterTitle => 'Register';

  @override
  String get phoneNumber => 'Phone number';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get name => 'Name';

  @override
  String get surname => 'Surname';

  @override
  String get birthDate => 'Date of birth';

  @override
  String get gender => 'Gender';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get authButtonSignIn => 'Sign in';

  @override
  String get authButtonSignUp => 'Sign up';

  @override
  String get authUserRegistered => 'Registration successful!';

  @override
  String get textFormFieldValidatorRequired => 'This field is required';

  @override
  String get textFormFieldValidatorPasswordMismatch => 'Password do not match';

  @override
  String get dashboardTabItemTitleHome => 'Home';

  @override
  String get dashboardTabItemTitleWorkout => 'Workouts';

  @override
  String get dashboardTabItemTitleLesson => 'Lessons';

  @override
  String get dashboardTabItemTitleShop => 'Shop';

  @override
  String get dashboardTabItemTitleProfile => 'Profile';

  @override
  String get profilePopupItemTitleEdit => 'Edit';

  @override
  String get profilePopupItemTitleLogout => 'Log out';

  @override
  String get editButtonSave => 'Save';

  @override
  String get buttonDelete => 'Delete';
}
