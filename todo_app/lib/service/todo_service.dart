import 'package:dio/dio.dart';
import 'package:todo_app/models/todo.dart';
import 'package:intl/intl.dart';

class TodoService {
  final Dio _dio = Dio();
  final String host = 'http://10.0.2.2:8080';

  Future<List<Todo>> getTodosByDate(String date) async {
    String requestUrl = "$host/todos/date?date=$date";

    try {
      Response response = await _dio.get(requestUrl);

      List<Todo> todos = (response.data as List).map((json) => Todo.fromJson(json)).toList();
      return todos;
    } catch (e) {
      print("날짜 확인 - $date: $e");
      return [];
    }
  }

  Future<void> insertTodo(Todo todo) async {
    try {
      await _dio.post("$host/todos", data: todo.toJson());
    } catch (e) {
      print("Error inserting todo: $e");
    }
  }

  Future<void> updateTodo(Todo todo) async {
    try {
      await _dio.put("$host/todos", data: todo.toJson());
    } catch (e) {
      print("Error updating todo: $e");
    }
  }

  Future<void> deleteTodo(String id) async {
  String requestUrl = "$host/todos/$id";

  try {
    Response response = await _dio.delete(requestUrl);
  } catch (e) {
    print("Error deleting todo: $e");
  }
}

}
