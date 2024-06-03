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
    selectedPage = 0;
    pageController = PageController(initialPage: selectedPage);
    context.read<OnBoardingCubit>().checkIfUserIsFirstTimer();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const pageCount = 3;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Background(
        child: BlocConsumer<OnBoardingCubit, OnBoardingState>(
          listener: (context, state) {
            if (state is OnBoardingStatus && !state.isFirstTimer) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state is UserCached) {
              // TODO(User-Cached): Push to the appropriate screen
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
                  children: const [
                    OnBoardingBody(pageContent: PageContent.first()),
                    OnBoardingBody(pageContent: PageContent.second()),
                    OnBoardingBody(pageContent: PageContent.third()),
                  ],
                ),
                Align(
                  alignment: const Alignment(0, .3),
                  child: PageViewDotIndicator(
                    currentItem: selectedPage,
                    count: pageCount,
                    unselectedColor: Colors.black26,
                    selectedColor: context.theme.primaryColor,
                    duration: const Duration(milliseconds: 200),
                    onItemClicked: (index) {
                      pageController.animateToPage(
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
