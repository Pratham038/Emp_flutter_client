import 'package:dio/dio.dart';
import 'package:employee_app/api_services/api_functions.dart';
import 'package:employee_app/api_services/api_requests/create_emp_request.dart';
import 'package:employee_app/api_services/api_responses/create_emp_response.dart';
import 'package:employee_app/api_services/api_responses/employee_response.dart';
import 'package:employee_app/api_services/dio_util.dart';
import 'package:employee_app/constants.dart';

class DioApi implements Api {
  @override
  Future<EmployeeResponse> getEmployees() async {
    try {
      final response = await DioUtil.dio.get(
        '${Constants.link}/employee',
        options: Options(
          validateStatus: (status) {
            return status! < 510;
          },
        ),
      );

      if (response.statusCode == 200) {
        return EmployeeResponse.fromJson(response.data);
      } else {
        throw response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  //

  @override
  Future<CreateEmployeeResponse> createEmployee(CreateEmpRequest req) async {
    try {
      final response = await DioUtil.dio.post(
        '${Constants.link}/employee',
        data: req.toJson(),
        options: Options(
          validateStatus: (status) {
            return status! < 510;
          },
        ),
      );

      if (response.statusCode == 201 || response.statusCode == 409) {
        return CreateEmployeeResponse.fromJson(response.data);
      } else {
        throw response.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}
