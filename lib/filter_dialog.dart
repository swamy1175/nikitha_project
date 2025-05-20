import 'package:flutter/material.dart';

import 'dropdown_widget.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FilterDialogState();
}

class _FilterDialogState extends State<FilterDialog> {
  String selectedStatus = 'Approved';
  DateTime? fromDate;
  DateTime? toDate;
  String? selectedActivity;
  String? selectedSubActivity;

  final List<String> activities = ['Dry Area Floor', 'Wet Area Floor'];
  final List<String> subActivities = ['Flooring Tiling', 'Wall Tiling'];

  Future<void> _pickDate(BuildContext context, bool isFrom) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2024, 1, 10),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
        } else {
          toDate = picked;
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fromDate = DateTime(2024, 1, 10);
    toDate = DateTime(2024, 1, 10);
    selectedActivity = activities[0];
    selectedSubActivity = subActivities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Dashboard Filter',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              FittedBox(
                child: Row(
                  children: ['Approved', 'Rejected', 'Open']
                      .map((status) => Row(
                    children: [
                      Radio<String>(
                        value: status,
                        groupValue: selectedStatus,
                        onChanged: (value) {
                          setState(() {
                            selectedStatus = value!;
                          });
                        },
                      ),
                      Text(status),
                    ],
                  ))
                      .toList(),
                ),
              ),

              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildDatePickerField(
                      label: 'Fromdate',
                      date: fromDate,
                      onTap: () => _pickDate(context, true),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildDatePickerField(
                      label: 'Date To',
                      date: toDate,
                      onTap: () => _pickDate(context, false),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
              buildDropdownField(
                label: 'Select Activity',
                value: selectedActivity,
                items: activities,
                onChanged: (value) {
                  setState(() {
                    selectedActivity = value;
                  });
                },
              ),

              const SizedBox(height: 15),

              buildDropdownField(
                label: 'Select Sub Activity',
                value: selectedSubActivity,
                items: subActivities,
                onChanged: (value) {
                  setState(() {
                    selectedSubActivity = value;
                  });
                },
              ),

              const SizedBox(height: 25),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                            side: BorderSide(color: Colors.black)),
                        onPressed: (){
                        Navigator.pop(context);
                      },child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),),),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child:  SizedBox(
                        height: 50,
                        child: MaterialButton(
                          color: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: Colors.black)),
                          onPressed: (){
                            Navigator.pop(context);
                          },child: Text('Apply',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDatePickerField({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        GestureDetector(
          onTap: onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: FittedBox(
              child: Row(
                children: [
                  Text(
                    date != null
                        ? '${date.day.toString().padLeft(2, '0')} '
                        '${_monthName(date.month)} '
                        '${date.year}'
                        : 'Select date',
                  ),
                  const Icon(Icons.calendar_today, size: 18),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }



  String _monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
