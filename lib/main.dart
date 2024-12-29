import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_v2/models/save_task.dart';
import 'package:todo_app_v2/pages/add_todo.dart';
import 'package:todo_app_v2/pages/dark-light-screen.dart';
import 'package:todo_app_v2/pages/todo_list.dart';
import 'package:todo_app_v2/providers/theme-provider.dart';
import 'package:todo_app_v2/services/user_service.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //   create: (context) => SaveTask(),
  //   child: const MyApp()),
  // );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (ctx) => ThemeProvider()),
      ChangeNotifierProvider(create: (ctx) => SaveTask()),
      ChangeNotifierProvider(create: (ctx) => UserService()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App Provider',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      initialRoute: '/',
      routes: {
        '/': (_) => const TodoList(),
        '/add-todo-screen': (_) => AddTodo(),
        '/dark-light-screen': (_) => const DarkLightSceeen(),
      },
    );
  }
}
