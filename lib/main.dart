import 'package:employee_app/api_services/dio_util.dart';
import 'package:employee_app/app_binding.dart';
import 'package:employee_app/local_storage/local_storage.dart';
import 'package:employee_app/routes/app_routes.dart';
import 'package:employee_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalStorage.sharedPreferences = await SharedPreferences.getInstance();

  await DioUtil.init();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      initialRoute: Routes.HOMESCREEN,
      defaultTransition: Transition.cupertino,
      getPages: AppRoutes.routes,
      initialBinding: AppBinding(),
      transitionDuration: const Duration(milliseconds: 800),
      smartManagement: SmartManagement.full,
      title: 'Employee Management App',
      builder: EasyLoading.init(
        builder: (context, child) {
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1),
              child: child!);
        },
      ),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..textColor = Colors.red
    ..indicatorType = EasyLoadingIndicatorType.threeBounce
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..progressColor = Colors.blue
    ..radius = 10.0
    ..backgroundColor = Colors.white
    ..indicatorColor = Colors.red
    ..maskColor = Colors.red
    ..userInteractions = false
    ..dismissOnTap = false
    ..animationStyle = EasyLoadingAnimationStyle.scale;
}
