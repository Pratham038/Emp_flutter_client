import 'package:employee_app/api_services/api_requests/create_emp_request.dart';
import 'package:employee_app/modules/Employees/employee_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class CreateEmpScreen extends StatelessWidget {
  CreateEmpScreen({Key? key}) : super(key: key);

  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  final EmployeeController empController = Get.put(EmployeeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: FormBuilder(
          key: _fbKey, // corrected the key name here
          child: Column(
            children: [
              //
              Container(
                width: double.infinity,
                child: FormBuilderTextField(
                  cursorColor: Colors.green,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  name: 'name',
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    floatingLabelStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                height: 6,
              ),
              //
              Container(
                width: double.infinity,
                child: FormBuilderTextField(
                  cursorColor: Colors.green,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  name: 'mail',
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    floatingLabelStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                ),
              ),
              //
              const SizedBox(
                height: 6,
              ),

              //
              Container(
                width: double.infinity,
                child: FormBuilderTextField(
                  cursorColor: Colors.green,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '*Required';
                    }
                    return null;
                  },
                  name: 'designation',
                  decoration: const InputDecoration(
                    labelText: 'Designation',
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    floatingLabelStyle: TextStyle(color: Colors.grey),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    ),
                  ),
                ),
              ),

              //
              const SizedBox(
                height: 6,
              ),
//

              Container(
                width: double.infinity,
                child: Theme(
                  data: Theme.of(context).copyWith(
                      textTheme: const TextTheme(
                          bodyText1: TextStyle(color: Colors.black)),
                      colorScheme: const ColorScheme.light(
                        primary: Colors.redAccent,
                        onPrimary: Colors.white,
                        secondary: Colors.black,
                      )),
                  child: FormBuilderDateTimePicker(
                    initialDate: DateTime(
                      DateTime.now().year - 18,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                    lastDate: DateTime(
                      DateTime.now().year - 18,
                      DateTime.now().month,
                      DateTime.now().day,
                    ),
                    firstDate: DateTime(
                      DateTime.now().year - 150,
                    ),
                    fieldHintText: 'D.O.B',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    validator: (value) {
                      if (value == null) {
                        return '*Required';
                      }
                      return null;
                    },
                    format: DateFormat("dd-MM-yyyy"),
                    valueTransformer: (value) {
                      return DateFormat('yyyy-MM-dd').format(value!);
                    },
                    name: 'dob',
                    inputType: InputType.date,
                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.red,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red, width: 1), // Increased width
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.red, width: 1), // Increased width
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                      labelText: 'Date Of Birth',
                      labelStyle: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 6,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_fbKey.currentState!.saveAndValidate()) {
                      // print(_fbKey.currentState!.value);
                      // print(_fbKey.currentState!.value['dob']);

                      empController.createEmployee(
                          CreateEmpRequest(
                              empName: _fbKey.currentState!.value['name'],
                              empMail: _fbKey.currentState!.value['mail'],
                              empDesignation:
                                  _fbKey.currentState!.value['designation'],
                              empJoiningDate:
                                  _fbKey.currentState?.value['dob']),
                          context);
                      //
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
