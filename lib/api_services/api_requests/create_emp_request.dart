class CreateEmpRequest {
  String? empName;
  String? empMail;
  String? empDesignation;
  String? empJoiningDate;

  CreateEmpRequest(
      {this.empName, this.empMail, this.empDesignation, this.empJoiningDate});

  CreateEmpRequest.fromJson(Map<String, dynamic> json) {
    empName = json['emp_name'];
    empMail = json['emp_mail'];
    empDesignation = json['emp_designation'];
    empJoiningDate = json['emp_joining_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['emp_name'] = this.empName;
    data['emp_mail'] = this.empMail;
    data['emp_designation'] = this.empDesignation;
    data['emp_joining_date'] = this.empJoiningDate;
    return data;
  }
}
