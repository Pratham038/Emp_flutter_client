import 'package:dio/dio.dart';
import 'package:employee_app/local_storage/local_storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class DioUtil {
  static late Dio dio;

  static Future init() async {
    dio = Dio()
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (RequestOptions requestOptions,
              RequestInterceptorHandler requestInterceptorHandler) async {
            EasyLoading.show();

            var token = LocalStorage.sharedPreferences!.getString("token");

            requestOptions.headers['authorization'] =
                'Basic c2FsdF90ZWNoX2RldnM6c2FsdF90ZWNoX2RldnM=';

            if (token != null) {
              requestOptions.headers['x-token'] = token;
              requestOptions.headers['token'] = token;
            }
            requestInterceptorHandler.next(requestOptions);
          },
          onResponse: (e, handler) {
            if (EasyLoading.isShow) {
              // if (!e.requestOptions.uri.toString().contains('transaction_id')) {
              EasyLoading.dismiss();
              // }
            }

            // if (e.statusCode != 200) {
            //   print('error');
            // }

            handler.next(e);
          },
          onError: (
            error,
            req,
          ) {
            EasyLoading.dismiss();

            // if (error.response?.statusCode == 401) {
            //   Get.to(const LoginScreen());
            // }
            // errorPopup(AccessStorageController.navigatorKey.currentContext!,
            //     error.toString());
            req.next(error);
          },
        ),
      );
  }
}
