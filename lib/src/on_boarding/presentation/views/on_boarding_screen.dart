import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_club_mobile/core/common/views/loading_view.dart';
import 'package:gym_club_mobile/core/common/widgets/background.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/src/on_boarding/domain/entities/page_content.dart';
import 'package:gym_club_mobile/src/on_boarding/presentation/cubit/on_boarding_cubit.dart';
import 'package:gym_club_mobile/src/on_boarding/presentation/widgets/on_boarding_body.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  static const routeName = '/';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late int selectedPage;
  late PageController pageController;

  @override
  void initState() {
    super.initState(); // Call super first in initState

    selectedPage = 0;
    pageController = PageController(initialPage: selectedPage);

    context.read<OnBoardingCubit>().checkIfUserIsFirstTimer();
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 3;

    return Scaffold(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      body: Background(
        child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) async {
            if (state is OnBoardingStatus && !state.isFirstTimer) {
              await Navigator.pushReplacementNamed(context, '/home');
            } else if (state is UserCached) {
              await Navigator.pushReplacementNamed(context, '/');
            }
          },
          builder: (context, state) {
            if (state is CheckingIfUserIsFirstTimer ||
                state is CachingFirstTimer) {
              return const LoadingView();
            }
            return Stack(
              children: [
                PageView(
                  controller: pageController,
                  onPageChanged: (page) {
                    setState(() {
                      selectedPage = page;
                    });
                  },
                  children: [
                    OnBoardingBody(pageContent: PageContent.first(context)),
                    OnBoardingBody(pageContent: PageContent.second(context)),
                    OnBoardingBody(pageContent: PageContent.third(context)),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, .3),
                  child: PageViewDotIndicator(
                    currentItem: selectedPage,
                    count: pageCount,
                    unselectedColor: context.theme.unselectedWidgetColor,
                    selectedColor:
                        context.theme.buttonTheme.colorScheme!.primary,
                    duration: const Duration(milliseconds: 200),
                    onItemClicked: (index) async {
                      await pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
