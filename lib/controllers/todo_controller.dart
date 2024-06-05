import 'dart:developer';

import 'package:get/get.dart';
import '../models/todo/todo_model.dart';
import '../repo/api_service.dart';

class TodoController extends GetxController {
  var todos = <TodoModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }

  void fetchTodos() async {
    try {
      isLoading(true);
      var todoList = await apiService.getTodos();
      todos.assignAll(todoList);
    } finally {
      isLoading(false);
    }
  }

  void addTodo() {
    var newTodo = TodoModel(
      userId: 1,
      id: todos.length + 1,
      title: 'New Todo',
      completed: false,
    );
    todos.insert(0, newTodo);
    log('New Todo added: ${newTodo.title}');
  }

  void updateTodoStatus(int index, bool status) {
    todos[index] = todos[index].copyWith(completed: status);
  }

  void updateTodoTitle(int index, String title) {
    todos[index] = todos[index].copyWith(title: title);
  }
}
