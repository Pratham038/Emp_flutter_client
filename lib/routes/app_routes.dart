import 'package:employee_app/modules/HomeScreen/home_bindings.dart';
import 'package:employee_app/modules/HomeScreen/home_screen.dart';
import 'package:employee_app/modules/splash_screen/spalsh_binding.dart';
import 'package:employee_app/modules/splash_screen/splash_screen.dart';
import 'package:employee_app/routes/routes.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class AppRoutes {
  static final routes = [
    GetPage(
        name: Routes.SPLASH,
        binding: SplashBinding(),
        page: () => const SplashScreenLatest()),
   
    GetPage(
        name: Routes.HOMESCREEN,
        binding: HomeBinding(),
        page: () => const HomeScreen()),
  ];
}
