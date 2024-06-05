import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/todo_controller.dart';
import 'todo_edit_page.dart';

class TodoListPage extends StatelessWidget {
  final TodoController todoController = Get.put(TodoController());
  final ScrollController scrollController = ScrollController();

  TodoListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO List', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.deepPurple,
        elevation: 10.0,
        shadowColor: Colors.deepPurpleAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Obx(() {
        if (todoController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          controller: scrollController,
          itemCount: todoController.todos.length,
          itemBuilder: (context, index) {
            final todo = todoController.todos[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              elevation: 5.0,
              child: ListTile(
                title: Text(todo.title),
                subtitle: Text('Completed: ${todo.completed}',
                    style: const TextStyle(color: Colors.grey)),
                onTap: () {
                  Get.to(() => TodoEditPage(index: index));
                },
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          todoController.addTodo();
          Future.delayed(const Duration(milliseconds: 300), () {
            scrollController.animateTo(
              scrollController.position.minScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          });
        },
        backgroundColor: Colors.deepPurple,
        elevation: 10.0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
