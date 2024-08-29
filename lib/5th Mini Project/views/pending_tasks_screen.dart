import 'package:first_mini_project/5th%20Mini%20Project/controllers/database_controller.dart';
import 'package:first_mini_project/5th%20Mini%20Project/controllers/task_controller.dart';
import 'package:first_mini_project/5th%20Mini%20Project/models/task.dart';
import 'package:first_mini_project/5th%20Mini%20Project/views/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingTasksScreen extends StatefulWidget {
  PendingTasksScreen({super.key});

  @override
  State<PendingTasksScreen> createState() => _PendingTasksScreenState();
}

class _PendingTasksScreenState extends State<PendingTasksScreen> {
  TextEditingController _searchController = TextEditingController();
  Future<List<Task>>? _pendingTasksFuture;
  static final _newFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    TaskController.tasks = FirebaseHelper().getAllTasks();
    _pendingTasksFuture = TaskController.getPendingTasks();
  }

  void _updateSearch(String query) {
    setState(() {
      _pendingTasksFuture = TaskController.searchPendingTasksByTitle(query);
    });
  }

  Future<void> updateTaskInput(context, taskId, title, description) async {
    TaskController.titleController.text = title;
    TaskController.descriptionController.text = description;
    return showDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Update Task"),
            content: SingleChildScrollView(
              child: taskInputForm(),
            ),
            actions: [
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.pink,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {
                        TaskController.titleController.clear();
                        TaskController.descriptionController.clear();
                        Get.back();
                      },
                      icon: const Icon(Icons.close))),
              Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                      onPressed: () {
                        try {
                          if (_newFormKey.currentState!.validate()) {
                            TaskController.updateTask(taskId);
                            Get.back();
                          } else {
                            Get.snackbar("Error", "Please Fill All Fields",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white);
                          }
                        } on Exception catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      icon: const Icon(Icons.add))),
            ],
          );
        }).whenComplete(() {
      setState(() {
        _updateSearch("");
      });
    });
  }

  Future<void> newTaskInput(context) async {
    return showDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Add New Task"),
            content: SingleChildScrollView(
              child: taskInputForm(),
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
                      icon: const Icon(Icons.close))),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                    onPressed: () {
                      try {
                        if (_newFormKey.currentState!.validate()) {
                          TaskController.addTask();
                          Get.back();
                        } else {
                          Get.snackbar("Error", "Please Fill All Fields",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white);
                        }
                      } on Exception catch (e) {
                        debugPrint(e.toString());
                      }
                    },
                    icon: const Icon(Icons.add)),
              ),
            ],
          );
        }).whenComplete(() {
      setState(() {
        _updateSearch("");
      });
    });
  }

  Form taskInputForm() {
    return Form(
      key: _newFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: TaskController.titleController,
            decoration: const InputDecoration(
                hintText: "Enter Task Title",
                labelText: "Task Title",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                )),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter Task Title";
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: TaskController.descriptionController,
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 5,
            decoration: InputDecoration(
              hintText: "Enter Task Description",
              labelText: "Task Description",
              contentPadding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.06, horizontal: Get.width * 0.03),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter Task Description";
              }
            },
          ),
        ],
      ),
    );
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
                  "Date: ${task.date}",
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  "Time: ${task.time}",
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        elevation: 40,
        onPressed: () async {
          await newTaskInput(context);
        },
        label: const Text("Add New Task"),
        icon: const Icon(Icons.task),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: Get.height * 0.017, horizontal: Get.width * 0.05),
              child: const Text(
                "Pending Tasks",
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
              future: _pendingTasksFuture,
              builder: (context, snapshot) {
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        const Text(
                          "No Tasks",
                          style: TextStyle(
                            color: Colors.purple,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Text(
                          "Tap on button to add new task",
                          style: TextStyle(
                            color: Colors.purple[300],
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
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
                            String todoId =
                                snapshot.data![index].id!.toString();
                            String todoTitle =
                                snapshot.data![index].title!.toString();
                            String todoDescription =
                                snapshot.data![index].description!.toString();
                            String todoDate =
                                snapshot.data![index].date!.toString();
                            String todoTime =
                                snapshot.data![index].time!.toString();

                            return Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Dismissible(
                                key: ValueKey<String>(todoId),
                                direction: DismissDirection.startToEnd,
                                onDismissed: (DismissDirection direction) {
                                  setState(() {
                                    TaskController.updateTaskStatus(
                                        todoId, todoTitle, todoDescription);
                                    snapshot.data!
                                        .remove(snapshot.data![index]);
                                    _updateSearch("");
                                  });
                                },
                                background: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Row(
                                        children: const [
                                          Icon(Icons.done_outline_rounded,
                                              color: Colors.white),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Text("Mark as Done",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                child: Container(
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
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              todoTitle,
                                              style: const TextStyle(
                                                fontSize: 22,
                                                fontWeight: FontWeight.w700,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          subtitle: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 8.0, bottom: 4.0),
                                            child: Text(
                                              todoDescription,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.white70),
                                            ),
                                          ),
                                          trailing: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.yellow,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.edit,
                                                color: Colors.purple,
                                                size: 25,
                                              ),
                                              onPressed: () {
                                                updateTaskInput(context, todoId,
                                                    todoTitle, todoDescription);
                                              },
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
                                                Text(
                                                  todoTime,
                                                  style: const TextStyle(
                                                    fontSize: 17,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 10,
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
