class EmployeeResponse {
  int? statusCode;
  Data? data;
  String? message;

  EmployeeResponse({this.statusCode, this.data, this.message});

  EmployeeResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = this.message;
    return data;
  }
}

class Data {
  List<Employees>? employees;

  Data({this.employees});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['employees'] != null) {
      employees = <Employees>[];
      json['employees'].forEach((v) {
        employees!.add(new Employees.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.employees != null) {
      data['employees'] = this.employees!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Employees {
  int? empId;
  String? empName;
  String? empMail;
  String? empDesignation;
  String? empJoiningDate;

  Employees(
      {this.empId,
      this.empName,
      this.empMail,
      this.empDesignation,
      this.empJoiningDate});

  Employees.fromJson(Map<String, dynamic> json) {
    empId = json['emp_id'];
    empName = json['emp_name'];
    empMail = json['emp_mail'];
    empDesignation = json['emp_designation'];
    empJoiningDate = json['emp_joining_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_id'] = this.empId;
    data['emp_name'] = this.empName;
    data['emp_mail'] = this.empMail;
    data['emp_designation'] = this.empDesignation;
    data['emp_joining_date'] = this.empJoiningDate;
    return data;
  }
}
