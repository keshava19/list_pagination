// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Employee _$EmployeeFromJson(Map<String, dynamic> json) {
  return Employee(
      id: json['id'] as int,
      displayName: json['displayName'] as String,
      email: json['email'] as String,
      employeeNumber: json['employeeNumber'] as String,
      mobilePhone: json['mobilePhone'],
      profileImageUrl: json['profileImageUrl'],
      department: json['department'] as String,
      jobtitle: json['jobtitle'] as String,
      secondaryJobTitle: json['secondaryJobTitle'],
      locationName: json['locationName'] as String);
}

Map<String, dynamic> _$EmployeeToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'displayName': instance.displayName,
      'email': instance.email,
      'employeeNumber': instance.employeeNumber,
      'mobilePhone': instance.mobilePhone,
      'profileImageUrl': instance.profileImageUrl,
      'department': instance.department,
      'jobtitle': instance.jobtitle,
      'secondaryJobTitle': instance.secondaryJobTitle,
      'locationName': instance.locationName
    };
