import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/cancle_task_screen.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progess_task_screen.dart';

import 'complete_task_screen.dart';


class MainBottomNevScreen extends StatefulWidget {
  const MainBottomNevScreen({super.key});

  @override
  State<MainBottomNevScreen> createState() => _MainBottomNevScreenState();
}

class _MainBottomNevScreenState extends State<MainBottomNevScreen> {
  int _selectedIndex=0;
  List<Widget> _screens = const[
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompleteTaskScreen(),
    CancleTaskScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index){
          _selectedIndex=index;
          setState(() {

          });
        },
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.add_box), label: 'New'),
          BottomNavigationBarItem(icon: Icon(Icons.ac_unit_rounded), label: 'In Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.mark_chat_read_rounded), label: 'Completed'),
          BottomNavigationBarItem(icon: Icon(Icons.access_time_outlined), label: 'Cancelled'),
        ],
      ),


    );
  }
}
