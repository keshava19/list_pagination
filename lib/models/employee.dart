import 'package:json_annotation/json_annotation.dart';

part 'employee.g.dart';

@JsonSerializable()
class Employee {
  int id;
  String displayName;
  String email;
  String employeeNumber;
  Object mobilePhone;
  Object profileImageUrl;
  String department;
  String jobtitle;
  Object secondaryJobTitle;
  String locationName;

  Employee({
    this.id,
    this.displayName,
    this.email,
    this.employeeNumber,
    this.mobilePhone,
    this.profileImageUrl,
    this.department,
    this.jobtitle,
    this.secondaryJobTitle,
    this.locationName,
  });

  Employee.loading() {
    displayName = 'loading...';
    jobtitle = 'loading...';
  }

  factory Employee.fromJson(Map<String, dynamic> json) =>
      _$EmployeeFromJson(json);

  Map<String, dynamic> toJson() => _$EmployeeToJson(this);
}
