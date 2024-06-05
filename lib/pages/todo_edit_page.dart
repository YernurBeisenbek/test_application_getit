import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';

class TodoEditPage extends StatefulWidget {
  final int index;

  const TodoEditPage({super.key, required this.index});

  @override
  TodoEditPageState createState() => TodoEditPageState();
}

class TodoEditPageState extends State<TodoEditPage> {
  late TodoController todoController;
  late TextEditingController titleController;
  late bool completed;

  @override
  void initState() {
    super.initState();
    todoController = Get.find<TodoController>();
    final todo = todoController.todos[widget.index];
    titleController = TextEditingController(text: todo.title);
    completed = todo.completed;
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void updateStatus(bool value) {
    setState(() {
      completed = value;
    });
    todoController.updateTodoStatus(widget.index, value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Todo', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {
                    todoController.updateTodoTitle(widget.index, value);
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text('Completed'),
                    Switch(
                      value: completed,
                      onChanged: updateStatus,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
