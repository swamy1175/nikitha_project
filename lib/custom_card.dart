import 'package:flutter/material.dart';

Widget CustomCard({
  required String date,
  required String time,
  required String status,
  required Color statusColor,
  required String tower,
  required String floor,
  required String unit,
  required String activity,
  required String subActivity,
  required String approver,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
              blurRadius: 0.9,
              color: Colors.grey
          )
        ]
    ),
      child: Padding(
        padding: const EdgeInsets.only(right: 40,left: 40,top: 20,bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.calendar_month_outlined, size: 16),
                Text(date,style: TextStyle(fontWeight: FontWeight.bold),),
                const Spacer(),
                const Icon(Icons.access_time, size: 16),
                Text(time,style: TextStyle(fontWeight: FontWeight.bold),),
                const Spacer(),
                Row(
                  children: [
                    Icon(Icons.circle, size: 10, color: statusColor),
                    Icon(Icons.circle, size: 10, color: statusColor),
                    const SizedBox(width: 8),
                    Text(
                      status,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Text.rich(TextSpan(children: [
                 TextSpan(text: 'Tower '),
                 TextSpan(text: tower,style: TextStyle(fontWeight: FontWeight.bold)),
               ])),
                const Spacer(),
                Text.rich(TextSpan(children: [
                  TextSpan(text: 'Floor '),
                  TextSpan(text: floor,style: TextStyle(fontWeight: FontWeight.bold)),
                ])),
                const Spacer(),
                Text.rich(TextSpan(children: [
                  TextSpan(text: 'Unit '),
                  TextSpan(text: unit,style: TextStyle(fontWeight: FontWeight.bold)),
                ])),
              ],
            ),
            const SizedBox(height: 8),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Activity  '),
              TextSpan(text: activity,style: TextStyle(fontWeight: FontWeight.bold)),
            ])),
            const SizedBox(height: 8),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Sub Activity Name  '),
              TextSpan(text: subActivity,style: TextStyle(fontWeight: FontWeight.bold)),
            ])),
            const SizedBox(height: 8),
            Text.rich(TextSpan(children: [
              TextSpan(text: 'Approver  '),
              TextSpan(text: approver,style: TextStyle(fontWeight: FontWeight.bold)),
            ])),
          ],
        ),
      ),
    ),
  );
}