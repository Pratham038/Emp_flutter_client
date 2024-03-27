import 'package:employee_app/models/enums.dart';
import 'package:employee_app/modules/Employees/employee_screen.dart';
import 'package:employee_app/modules/HomeScreen/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          DashboardItem(
            title: 'Employees',
            icon: Icons.people,
            onTap: () {
              Get.to(EmployeeScreen());
            },
          ),
          DashboardItem(
            title: 'Inventory',
            icon: Icons.inventory,
            onTap: () {},
          ),
          DashboardItem(
            title: 'Events',
            icon: Icons.event,
            onTap: () {},
          ),
          DashboardItem(
            title: 'Holiday List',
            icon: Icons.calendar_today,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class DashboardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const DashboardItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 3,
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 50,
            ),
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
