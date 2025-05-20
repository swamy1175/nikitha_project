import 'dart:ui';

class HomeModel {
  final String date;
  final String time;
  final String status;
  final Color statusColor;
  final String tower;
  final String floor;
  final String unit;
  final String activity;
  final String subActivity;
  final String approver;

  HomeModel({
    required this.date,
    required this.time,
    required this.status,
    required this.statusColor,
    required this.tower,
    required this.floor,
    required this.unit,
    required this.activity,
    required this.subActivity,
    required this.approver,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) {
    return HomeModel(
      date: json['date'],
      time: json['time'],
      status: json['status'],
      statusColor: json['statusColor'],
      tower: json['tower'],
      floor: json['floor'],
      unit: json['unit'],
      activity: json['activity'],
      subActivity: json['subActivity'],
      approver: json['approver'],
    );
  }
}
