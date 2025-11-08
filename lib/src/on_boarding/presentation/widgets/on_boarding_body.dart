import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_club_mobile/core/common/widgets/custom_elevated_button.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/l10n/app_localizations.dart';
import 'package:gym_club_mobile/src/on_boarding/domain/entities/page_content.dart';
import 'package:gym_club_mobile/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({required this.pageContent, super.key});

  final PageContent pageContent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 0),
          child: Column(
            children: [
              SizedBox(height: context.height * .25),
              Text(
                pageContent.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: context.height * .02),
              Text(
                pageContent.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(height: context.height * .25),
              CustomElevatedButton(
                label: AppLocalizations.of(context)!.onBoardingButtonGetStarted,
                onPressed: () async {
                  await context.read<OnBoardingCubit>().cacheFirstTimer();
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
