import 'package:flutter/material.dart';
import 'package:nikitha/bottom_nav_bar.dart';
import 'package:nikitha/custom_card.dart';
import 'package:nikitha/filter_dialog.dart';
import 'package:nikitha/model/home_model.dart';
import 'package:nikitha/success_dialog.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> jsonData = const [
    {
      "date": "1 Dec 2023",
      "time": "13:45",
      "status": "Open",
      "statusColor": Colors.orange,
      "tower": "Tower A",
      "floor": "A-P4",
      "unit": "A0402",
      "activity": "Dry Area Floor",
      "subActivity": "Flooring Tiling",
      "approver": "Engineers, QCS, QAQC"
    },
    {
      "date": "1 Dec 2023",
      "time": "13:45",
      "status": "Rejected",
      "statusColor": Colors.red,
      "tower": "Tower A",
      "floor": "A-P4",
      "unit": "A0402",
      "activity": "Dry Area Floor",
      "subActivity": "Flooring Tiling",
      "approver": "QCS, QAQC"
    },
    {
      "date": "1 Dec 2023",
      "time": "13:45",
      "status": "Approved",
      "statusColor": Colors.green,
      "tower": "Tower C",
      "floor": "P-6",
      "unit": "C0608",
      "activity": "Dry Area Floor",
      "subActivity": "Flooring Tiling",
      "approver": "QCS"
    }
  ];
   List<HomeModel>? items;
  @override
  void initState() {
    super.initState();

    items= jsonData.map((e) => HomeModel.fromJson(e)).toList();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: const Text('Dashboard List',style:TextStyle(fontWeight: FontWeight.bold),)),
        leading: const Icon(Icons.arrow_back),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search...',
                suffixIcon:  IconButton(icon:Icon(Icons.tune),onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context) => const FilterDialog(),
                  );
                },),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: items?.length,
              itemBuilder: (context,index){
                HomeModel homedata = items![index];
                return InkWell(
                  onTap: (){
                    showDialog(
                      context: context,
                      builder: (_) => const SuccessDialog(title: 'Thank You',message: 'Your request has been submitted.',),
                    );
                  },
                  child: CustomCard(
                    activity: homedata.activity,
                    approver: homedata.approver,
                    date: homedata.date,
                    floor: homedata.floor,
                    status: homedata.status,
                    statusColor: homedata.statusColor,
                    subActivity: homedata.subActivity,
                    time: homedata.time,
                    tower: homedata.tower,
                    unit: homedata.unit
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar:CustomBottomNavBar()
    );
  }}