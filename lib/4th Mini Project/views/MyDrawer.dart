import 'package:first_mini_project/4th%20Mini%20Project/views/done_tasks_screen.dart';
import 'package:first_mini_project/4th%20Mini%20Project/views/pending_tasks_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Text("Todo App",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                )),
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          ListTile(
            tileColor: Colors.purple[100],
            leading: const Icon(
              Icons.pending_actions_rounded,
              color: Colors.purple,
              size: 28,
            ),
            title: const Text(
              "Pending",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Get.offAll(() => (PendingTasksScreen()));
            },
          ),
          SizedBox(
            height: Get.height * 0.015,
          ),
          ListTile(
            tileColor: Colors.purple[100],
            leading: const Icon(
              Icons.done_outline_rounded,
              color: Colors.purple,
              size: 28,
            ),
            title: const Text(
              "Done",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            onTap: () {
              Get.offAll(const DoneTasksScreen());
            },
          ),
        ],
      ),
    );
  }
}
