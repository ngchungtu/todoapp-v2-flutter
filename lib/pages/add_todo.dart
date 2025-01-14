import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v2/models/save_task.dart';
import 'package:todo_app_v2/models/task_model.dart';

class AddTodo extends StatelessWidget {
  AddTodo({super.key});

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(
                hintText: 'Title...',
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                context.read<SaveTask>().addTask(
                      Task(
                        title: controller.text,
                        isCompleted: false,
                      ),
                    );
                controller.clear(); //cls textField
                Navigator.of(context).pop(); // back to main screen
              },
              child: const Text("Add"),
            ),
          ],
        ),
      ),
    );
  }
}
