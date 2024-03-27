import 'package:employee_app/modules/HomeScreen/home_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  // AuthController authController = Get.put(AuthController());

  @override
  void onReady() async {
    // await Future.delayed(const Duration(milliseconds: 2300));
    try {
      // String accessToken =
      //     LocalStorage.sharedPreferences!.getString('token') ?? '';
      // if (accessToken.isEmpty) {
      //   Get.offAll(LoginScreen());
      //   return;
      // } else {
      Get.offAll(HomeScreen());
      // }
    } catch (e) {}

    super.onReady();
  }
}
