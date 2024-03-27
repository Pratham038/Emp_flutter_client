import 'package:employee_app/models/enums.dart';
import 'package:employee_app/modules/Employees/create_user_screen.dart';
import 'package:employee_app/modules/Employees/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  final EmployeeController empController = Get.put(EmployeeController());

  @override
  void initState() {
    empController.getEmployees();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        title: const Text('Employees Section'),
        actions: [
          InkWell(
            onTap: () {
              Get.to(CreateEmpScreen());
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.person_add),
            ),
          )
        ],
      ),
      body: Obx(
        () => SizedBox(
          child: empController.empDataState.value == DataState.loading
              ? const Text('LOADING')
              : Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: empController
                                .userResposne.value.data?.employees?.length ??
                            0,
                        itemBuilder: (context, index) {
                          var emp = empController.empList[index];
                          print(emp.empJoiningDate.toString());
                          return Card(
                            margin: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${emp?.empName ?? ''}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Text(
                                        'ID: ${emp!.empId}',
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    '${emp.empMail}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 15),
                                  Text(
                                    'Designation: ${emp.empDesignation}',
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Joining Date: ${DateFormat('dd/MM/yyyy').format(DateTime.parse(emp.empJoiningDate.toString()))}',
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      emp != null &&
                                              DateTime.now()
                                                      .difference(
                                                          DateTime.parse(emp
                                                              .empJoiningDate
                                                              .toString()))
                                                      .inDays >
                                                  5 * 365
                                          ? Icon(
                                              Icons.flag,
                                              color: Colors.green,
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
