import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru')
  ];

  /// Title displayed on the first onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Welcome.'**
  String get onBoardingTitleFirst;

  /// Description text shown on the first onboarding screen explaining the app's purpose
  ///
  /// In en, this message translates to:
  /// **'This is a mobile application for clients and trainers of the GymClub gym.'**
  String get onBoardingDescriptionFirst;

  /// Title displayed on the second onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Training programs.'**
  String get onBoardingTitleSecond;

  /// Description text shown on the second onboarding screen about training programs
  ///
  /// In en, this message translates to:
  /// **'Choose a suitable training program for yourself and track its progress.'**
  String get onBoardingDescriptionSecond;

  /// Title displayed on the third onboarding screen
  ///
  /// In en, this message translates to:
  /// **'Classes with trainers.'**
  String get onBoardingTitleThird;

  /// Description text shown on the third onboarding screen about trainer classes
  ///
  /// In en, this message translates to:
  /// **'Sign up for group classes with trainers.'**
  String get onBoardingDescriptionThird;

  /// Button text to finish onboarding and proceed to the main app
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get onBoardingButtonGetStarted;

  /// Title displayed on the login screen
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get authLoginTitle;

  /// Title displayed on the registration screen
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get authRegisterTitle;

  /// Label for phone number input field
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// Label for password input field
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Label for password confirmation input field
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get confirmPassword;

  /// Label for name input field
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Label for surname input field
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// Label for date of birth input field
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get birthDate;

  /// Label for gender selection
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// Option for male gender selection
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// Option for female gender selection
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// Button text to submit login form
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get authButtonSignIn;

  /// Button text to submit registration form
  ///
  /// In en, this message translates to:
  /// **'Sign up'**
  String get authButtonSignUp;

  /// Success message shown after successful user registration
  ///
  /// In en, this message translates to:
  /// **'Registration successful!'**
  String get authUserRegistered;

  /// Error message shown when a required field is empty
  ///
  /// In en, this message translates to:
  /// **'This field is required'**
  String get textFormFieldValidatorRequired;

  /// Error message shown when password and confirm password fields don't match
  ///
  /// In en, this message translates to:
  /// **'Password do not match'**
  String get textFormFieldValidatorPasswordMismatch;

  /// Title for the home tab in the bottom navigation bar
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get dashboardTabItemTitleHome;

  /// Title for the workouts tab in the bottom navigation bar
  ///
  /// In en, this message translates to:
  /// **'Workouts'**
  String get dashboardTabItemTitleWorkout;

  /// Title for the lessons tab in the bottom navigation bar
  ///
  /// In en, this message translates to:
  /// **'Lessons'**
  String get dashboardTabItemTitleLesson;

  /// Title for the shop tab in the bottom navigation bar
  ///
  /// In en, this message translates to:
  /// **'Shop'**
  String get dashboardTabItemTitleShop;

  /// Title for the profile tab in the bottom navigation bar
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get dashboardTabItemTitleProfile;

  /// Label for the edit option in profile popup menu
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get profilePopupItemTitleEdit;

  /// Label for the logout option in profile popup menu
  ///
  /// In en, this message translates to:
  /// **'Log out'**
  String get profilePopupItemTitleLogout;

  /// Button text to save changes in edit forms
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get editButtonSave;

  /// Button text for delete actions
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get buttonDelete;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
