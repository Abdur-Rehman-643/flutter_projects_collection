import 'package:first_mini_project/4th%20Mini%20Project/controllers/database_controller.dart';
import 'package:first_mini_project/4th%20Mini%20Project/controllers/task_controller.dart';
import 'package:first_mini_project/4th%20Mini%20Project/models/task.dart';
import 'package:first_mini_project/4th%20Mini%20Project/views/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoneTasksScreen extends StatefulWidget {
  const DoneTasksScreen({super.key});

  @override
  State<DoneTasksScreen> createState() => _DoneTasksScreenState();
}

class _DoneTasksScreenState extends State<DoneTasksScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<List<Task>>? _doneTasksFuture;
  static final _newFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _doneTasksFuture = TaskController.getDoneTasks();
  }

  void _updateSearch(String query) {
    setState(() {
      _doneTasksFuture = TaskController.searchDoneTasksByTitle(query);
    });
  }

  void _showTaskDetails(Task task) {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Task Details"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title: ${task.title}",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "Description: ${task.description}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  "Completed Date: ${task.date}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  "Completed Time: ${task.time}",
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          actions: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.pink,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<bool?> _showConfirmationDialog() {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // Prevents dismissal by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirm Deletion"),
          content: const Text("Are you sure you want to delete this task?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // User pressed "No"
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // User pressed "Yes"
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.black.withOpacity(0.5),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.purple),
        title: const Text("Todo App",
            style: TextStyle(
              color: Colors.purple,
              fontSize: 28,
              fontWeight: FontWeight.w700,
            )),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      drawer: MyDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.017, horizontal: Get.width * 0.05),
              child: const Text(
                "Done Tasks",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const Divider(
              color: Colors.purple,
              thickness: 2,
              indent: 20,
              endIndent: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Get.width * 0.05, vertical: Get.height * 0.01),
              child: TextField(
                controller: _searchController,
                onChanged: _updateSearch,
                decoration: InputDecoration(
                  labelText: "Search by title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            FutureBuilder<List<Task>>(
                future: _doneTasksFuture,
                builder: (context, snapshot) {
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: Get.height * 0.3,
                          ),
                          Text(
                            "No Tasks Completed Yet",
                            style: TextStyle(
                              color: Colors.purple[300],
                              fontSize: 28,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text("Error"),
                    );
                  } else if (snapshot.hasData) {
                    return Column(
                      children: [
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              int todoId = snapshot.data![index].id!.toInt();
                              String todoTitle =
                                  snapshot.data![index].title!.toString();
                              String todoDescription =
                                  snapshot.data![index].description!.toString();
                              String todoDate =
                                  snapshot.data![index].date!.toString();
                              String todoTime =
                                  snapshot.data![index].time!.toString();
                              // int todoStatus = snapshot.data![index].status!.toInt();

                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Dismissible(
                                  background: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      ),
                                    ),
                                    padding: const EdgeInsets.only(
                                        right: 20, left: 20),
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4, horizontal: 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(1.0),
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  key: UniqueKey(),
                                  direction: DismissDirection.horizontal,
                                  onDismissed: (direction) async {
                                    final itemIndex = snapshot.data!.indexWhere(
                                        (task) => task.id == todoId);
                                    final removedItem =
                                        snapshot.data!.removeAt(itemIndex);
                                    bool? confirm =
                                        await _showConfirmationDialog();
                                    if (confirm == true) {
                                      DatabaseController.delete(todoId);
                                      _updateSearch("");
                                    } else {
                                      setState(() {
                                        snapshot.data!
                                            .insert(itemIndex, removedItem);
                                      });
                                    }
                                  },
                                  child: Container(
                                      // margin: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        color: Colors.purple.shade300,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 3,
                                            blurRadius: 4,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      // margin: const EdgeInsets.all(10.0),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            contentPadding:
                                                const EdgeInsets.all(10),
                                            title: Text(
                                              todoTitle,
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                            subtitle: Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 8.0),
                                              child: Text(
                                                todoDescription,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white70),
                                              ),
                                            ),
                                            onTap: () {
                                              _showTaskDetails(Task(
                                                id: todoId,
                                                title: todoTitle,
                                                description: todoDescription,
                                                date: todoDate,
                                                time: todoTime,
                                                status: 0,
                                              ));
                                            },
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Divider(
                                              color: Colors.white,
                                              thickness: 1.2,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 3,
                                              horizontal: 10,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  const Text("Completed at: ",
                                                      style: TextStyle(
                                                        fontSize: 17,
                                                        color: Colors.white,
                                                      )),
                                                  SizedBox(
                                                    width: Get.width * 0.02,
                                                  ),
                                                  Text(
                                                    todoTime,
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.02,
                                                  ),
                                                  Text(
                                                    todoDate,
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ),
                              );
                            }),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}
