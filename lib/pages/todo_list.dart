import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v2/components/user.dart';
import 'package:todo_app_v2/models/save_task.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:todo_app_v2/models/user_model.dart';
import 'package:todo_app_v2/providers/theme-provider.dart';
import 'package:todo_app_v2/services/user_service.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TodoList> {
  @override
  void initState() {
    super.initState();
    UserService.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<ThemeProvider, SaveTask>(
      builder: (context, themeProvider, task, saveTask) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo List'),
            actions: [
              // #region Switch to change theme
              Switch(
                activeColor: Colors.white,
                inactiveThumbColor: Colors.white,
                thumbColor: const MaterialStatePropertyAll(Colors.orange),
                inactiveTrackColor: Colors.transparent,
                thumbIcon: MaterialStatePropertyAll(
                  themeProvider.isSelected
                      ? const Icon(Icons.nights_stay)
                      : const Icon(Icons.sunny),
                ),
                value: themeProvider.isSelected,
                onChanged: (value) {
                  themeProvider.toggledTheme();
                },
              ),
              // #endregion
            ],
          ),
          floatingActionButton: SpeedDial(
            icon: Icons.more,
            backgroundColor: Colors.blue,
            // #region Floating action buttons
            children: [
              SpeedDialChild(
                child: const Icon(Icons.edit, color: Colors.white),
                label: 'Add new todo',
                backgroundColor: Colors.blueAccent,
                onTap: () {
                  Navigator.of(context).pushNamed('/add-todo-screen');
                },
              ),
              SpeedDialChild(
                child:
                    const Icon(Icons.toggle_on_outlined, color: Colors.white),
                label: 'Change theme',
                backgroundColor: Colors.blueAccent,
                onTap: () {
                  Navigator.of(context).pushNamed('/dark-light-screen');
                },
              ),
              // #endregion
            ],
          ),
          body: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: task.tasks.length,
                      itemBuilder: (BuildContext context, index) {
                        return Consumer<ThemeProvider>(
                          builder: (context, themeProvider, child) {
                            return Container(
                              decoration: BoxDecoration(
                                color: themeProvider.isSelected
                                    ? const Color.fromARGB(142, 195, 235, 87)
                                    : const Color.fromARGB(70, 89, 28, 238),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.only(
                                right: 7,
                                left: 7,
                                bottom: 5,
                                top: 3,
                              ),
                              child: ListTile(
                                // #region Task content
                                title: Text(
                                  task.tasks[index].title,
                                  style: TextStyle(
                                    decoration: task.tasks[index].isCompleted
                                        ? TextDecoration.lineThrough
                                        : TextDecoration.none,
                                    color: themeProvider.isSelected
                                        ? Colors.white70
                                        : Colors.black87,
                                  ),
                                ),
                                // #endregion
                                trailing: Wrap(
                                  // #region Action button on single task
                                  children: [
                                    Checkbox(
                                      value: task.tasks[index].isCompleted,
                                      onChanged: (_) {
                                        context
                                            .read<SaveTask>()
                                            .toggleTaskStatus(index);
                                      },
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        context
                                            .read<SaveTask>()
                                            .deleteTask(task.tasks[index]);
                                      },
                                      icon: const Icon(Icons.delete),
                                    ),
                                  ],
                                  // #endregion
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      color: Colors.pinkAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FutureBuilder<List<UserModel>>(
                      future: UserService.getUsers(),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<UserModel>> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          return Flexible(
                            flex: 1,
                            child: ListView.builder(
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                final item = snapshot.data![index];
                                return UserComponent(user: item);
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}
