import 'package:auto_route/auto_route.dart';
import 'package:wst/presentation/breed_details_screen/breed_details_screen.dart';
import 'package:wst/presentation/breeds_screen/breeds_screen.dart';
import 'package:wst/presentation/home_screen/home_screen.dart';
import 'package:wst/presentation/profile_screen/profile_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
  AppRouter();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        AutoRoute(
          page: HomeRoute.page,
          path: HomeScreen.path,
          initial: true,
          children: [
            AutoRoute(
              page: BreedsRoute.page,
              path: BreedsScreen.path,
            ),
            AutoRoute(
              path: BreedDetailsScreen.path,
              page: BreedDetailsRoute.page,
            ),
            AutoRoute(
              path: ProfileScreen.path,
              page: ProfileRoute.page,
            ),
          ],
        ),
      ];
}
