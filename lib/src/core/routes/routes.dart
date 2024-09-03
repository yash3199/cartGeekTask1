import 'package:get/get_navigation/src/routes/get_route.dart';
import '../../presentation/view/bottomNavigation/bottom_navigation.dart';
import '../../presentation/view/home/home_view.dart';
import '../../presentation/view/package/package_view.dart';

class Routes {
  static const homeScreenView = '/homeScreenView';
  static const packageScreenView = '/packageScreenView';
  static const bottomNavigation = '/bottomNavigation';
}




class AppPages {
  static var pages = [
    GetPage(
      name: Routes.homeScreenView,
      page: () => const HomeView(),
    ),
    GetPage(
      name: Routes.packageScreenView,
      page: () => const PackageView(),
    ),
    GetPage(
      name: Routes.bottomNavigation,
      page: () =>  BottomNavigationPage(),
    ),
  ];
}