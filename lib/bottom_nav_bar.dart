import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {

  const CustomBottomNavBar({super.key,});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}
int currentIndex =0;

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Stack(
        children: [
          BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value){
             currentIndex=value;
             setState(() {

             });
            },
            items: [
              BottomNavigationBarItem(
                icon: currentIndex == 0
                    ? Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black,
                  ),
                  child: const Icon(Icons.home, color: Color(0xFFFACD66)), // gold
                )
                    : const Icon(Icons.home_outlined, color: Colors.grey),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
                    color: currentIndex == 1 ? Colors.black : Colors.grey),
                label: 'Profile',
              ),
            ],
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
            unselectedItemColor: Colors.grey,
            selectedItemColor: Colors.black,
            showUnselectedLabels: true,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          /*Positioned(
            right: 10,
            top: 5,
            child: Image.asset(
              'assets/sobha_logo.png',
              height: 40,
            ),
          ),*/
        ],
      ),
    );
  }
}
