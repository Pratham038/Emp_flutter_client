import 'package:employee_app/modules/Employees/employee_controller.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';

class EmployeeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<EmployeeController>(EmployeeController());
  }
}
