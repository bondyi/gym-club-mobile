// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get onBoardingTitleFirst => 'Добро пожаловать.';

  @override
  String get onBoardingDescriptionFirst =>
      'Это мобильное приложение для клиентов и тренеров тренажерного зала GymClub.';

  @override
  String get onBoardingTitleSecond => 'Программы тренировок.';

  @override
  String get onBoardingDescriptionSecond =>
      'Подберите для себя подходящую программу тренировок и отслеживайте её прогресс.';

  @override
  String get onBoardingTitleThird => 'Занятия с тренерами.';

  @override
  String get onBoardingDescriptionThird =>
      'Записывайтесь на групповые занятия с тренерами.';

  @override
  String get onBoardingButtonGetStarted => 'Начать';

  @override
  String get authLoginTitle => 'Авторизация';

  @override
  String get authRegisterTitle => 'Регистрация';

  @override
  String get phoneNumber => 'Номер телефона';

  @override
  String get password => 'Пароль';

  @override
  String get confirmPassword => 'Подтверждение пароля';

  @override
  String get name => 'Имя';

  @override
  String get surname => 'Фамилия';

  @override
  String get birthDate => 'Дата рождения';

  @override
  String get gender => 'Пол';

  @override
  String get genderMale => 'Мужчина';

  @override
  String get genderFemale => 'Женщина';

  @override
  String get authButtonSignIn => 'Войти';

  @override
  String get authButtonSignUp => 'Зарегистрироваться';

  @override
  String get authUserRegistered => 'Регистрация прошла успешно!';

  @override
  String get textFormFieldValidatorRequired =>
      'Это поле обязательно к заполнению';

  @override
  String get textFormFieldValidatorPasswordMismatch => 'Пароли не совпадают';

  @override
  String get dashboardTabItemTitleHome => 'Главная';

  @override
  String get dashboardTabItemTitleWorkout => 'Тренировки';

  @override
  String get dashboardTabItemTitleLesson => 'Занятия';

  @override
  String get dashboardTabItemTitleShop => 'Магазин';

  @override
  String get dashboardTabItemTitleProfile => 'Профиль';

  @override
  String get profilePopupItemTitleEdit => 'Изменить';

  @override
  String get profilePopupItemTitleLogout => 'Выход';

  @override
  String get editButtonSave => 'Сохранить';

  @override
  String get buttonDelete => 'Удалить';
}
