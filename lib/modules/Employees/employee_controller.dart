import 'package:employee_app/api_services/api_responses/create_emp_response.dart';
import 'package:employee_app/api_services/api_responses/employee_response.dart';
import 'package:employee_app/api_services/dio_api.dart';
import 'package:employee_app/models/enums.dart';
import 'package:employee_app/widgets/poppups.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class EmployeeController extends GetxController {
  Rx<EmployeeResponse> userResposne = EmployeeResponse().obs;
  Rx<CreateEmployeeResponse> crEmpRes = CreateEmployeeResponse().obs;
  Rx<DataState> empDataState = DataState.stable.obs;
  RxList<Employees> empList = <Employees>[].obs;
  RxBool sort = false.obs;

  void toggleOrder() {
    sort.value = !sort.value;
  }

  Future<void> getEmployees() async {
    empDataState.value == DataState.loading;
    try {
      var res = await DioApi().getEmployees();

      if (res.statusCode == 200) {
        userResposne.value = res;
        empList.value = userResposne.value.data?.employees?.toList() ?? [];
        empDataState.value == DataState.stable;
      }
    } finally {
      empDataState.value == DataState.stable;
    }
  }
//

  Future createEmployee(req, context) async {
    try {
      var response = await DioApi().createEmployee(req);

      if (response.statusCode == 201) {
        successPopup(
          context,
          'Employee Added Successfully',
        );
        getEmployees();
      }
      if (response.statusCode == 409) {
        errorPopup(
          context,
          'Employee already exists',
        );
      }
    } catch (e) {
      errorPopup(
        context,
        'Failed to update.',
      );
    }
  }
}
