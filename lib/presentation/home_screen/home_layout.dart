import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:wst/generated/l10n.dart';
import 'package:wst/navigation/app_router.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      routes: const [
        BreedsRoute(),
        ProfileRoute(),
        BreedDetailsRoute(),
      ],
      bottomNavigationBuilder: (_, tabsRouter) {
        return SalomonBottomBar(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          currentIndex: tabsRouter.activeIndex,
          onTap: tabsRouter.setActiveIndex,
          items: [
            SalomonBottomBarItem(
              selectedColor: Colors.black,
              unselectedColor: Colors.blueGrey,
              icon: const Icon(
                Icons.post_add,
                size: 30,
              ),
              title: Text(S.of(context).breeds),
            ),
            SalomonBottomBarItem(
              selectedColor: Colors.black,
              unselectedColor: Colors.blueGrey,
              icon: const Icon(
                Icons.settings,
                size: 30,
              ),
              title: Text(S.of(context).profile),
            ),
          ],
        );
      },
    );
  }
}
