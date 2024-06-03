import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.title,
    required this.description,
  });

  PageContent.first(BuildContext context)
      : this(
          title: AppLocalizations.of(context)!.onBoardingTitleFirst,
          description: AppLocalizations.of(context)!.onBoardingDescriptionFirst,
        );

  PageContent.second(BuildContext context)
      : this(
          title: AppLocalizations.of(context)!.onBoardingTitleSecond,
          description: AppLocalizations.of(context)!.onBoardingDescriptionSecond,
        );

  PageContent.third(BuildContext context)
      : this(
          title: AppLocalizations.of(context)!.onBoardingTitleThird,
          description: AppLocalizations.of(context)!.onBoardingDescriptionThird,
        );

  final String title;
  final String description;

  @override
  List<Object?> get props => [title, description];
}
