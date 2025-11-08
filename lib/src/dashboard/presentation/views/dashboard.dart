import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_club_mobile/core/extensions/context_extension.dart';
import 'package:gym_club_mobile/l10n/app_localizations.dart';
import 'package:gym_club_mobile/src/dashboard/presentation/providers/dashboard_controller.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  static const routeName = '/dashboard';

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Future<void> initState() async {
    super.initState();
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (_, controller, __) {
        return Scaffold(
          body: IndexedStack(
            index: controller.currentIndex,
            children: controller.screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex,
            showSelectedLabels: true,
            onTap: controller.changeIndex,
            unselectedItemColor: context.theme.unselectedWidgetColor,
            selectedItemColor: context.theme.buttonTheme.colorScheme!.primary,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                activeIcon: const Icon(Icons.home),
                label: AppLocalizations.of(context)!.dashboardTabItemTitleHome,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.fitness_center_outlined),
                activeIcon: const Icon(Icons.fitness_center),
                label:
                    AppLocalizations.of(context)!.dashboardTabItemTitleWorkout,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.event_outlined),
                activeIcon: const Icon(Icons.event),
                label:
                    AppLocalizations.of(context)!.dashboardTabItemTitleLesson,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.shopping_cart_outlined),
                activeIcon: const Icon(Icons.shopping_cart),
                label: AppLocalizations.of(context)!.dashboardTabItemTitleShop,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle_outlined),
                activeIcon: const Icon(Icons.account_circle),
                label:
                    AppLocalizations.of(context)!.dashboardTabItemTitleProfile,
              ),
            ],
          ),
        );
      },
    );
  }
}
