// ignore_for_file: lines_longer_than_80_chars

import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.title,
    required this.description,
  });

  const PageContent.first()
      : this(
          title: 'Добро пожаловать.',
          description:
              'Это мобильное приложение для клиентов и тренеров тренажерного зала GymClub.',
        );

  const PageContent.second()
      : this(
          title: 'Программы тренировок.',
          description:
              'Подберите для себя подходящую программу тренировок и отслеживайте её прогресс.',
        );

  const PageContent.third()
      : this(
          title: 'Занятия с тренерами.',
          description: 'Записывайтесь на групповые занятия с тренерами.',
        );

  final String title;
  final String description;

  @override
  List<Object?> get props => [title, description];
}
