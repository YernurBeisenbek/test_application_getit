import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'pages/todo_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter TODO App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 86, 52, 145)),
        useMaterial3: true,
      ),
      home: TodoListPage(),
    );
  }
}
