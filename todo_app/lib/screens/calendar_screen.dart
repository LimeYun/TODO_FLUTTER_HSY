import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/service/todo_service.dart';
import 'package:todo_app/models/todo.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  late CalendarFormat _calendarFormat;
  DateTime _selectedDate = DateTime.now();
  List<Todo> _todoList = [];
  final TodoService _todoService = TodoService();

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _fetchTodosByDate(_selectedDate);
  }

  Future<void> _fetchTodosByDate(DateTime date) async {
    String formattedDate = DateFormat('yyyy-MM-dd').format(date);

    List<Todo> todos = await _todoService.getTodosByDate(formattedDate);

    setState(() {
      _todoList = todos;
    });
  }

  Future<void> _addOrUpdateTodo({Todo? todo}) async {
    TextEditingController nameController = TextEditingController(text: todo?.name ?? "");

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(todo == null ? '할 일 추가' : '할 일 수정'),
          content: TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: "할 일을 입력하세요"),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("취소"),
            ),
            TextButton(
              onPressed: () async {
                String formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
                Todo newTodo = Todo(
                  id: todo?.id ?? DateTime.now().toString(),
                  name: nameController.text,
                  todoDate: formattedDate,
                  status: todo?.status ?? false,
                );

                if (todo == null) {
                  await _todoService.insertTodo(newTodo);
                } else {
                  await _todoService.updateTodo(newTodo);
                }

                Navigator.pop(context);
                _fetchTodosByDate(_selectedDate);
              },
              child: Text(todo == null ? "추가" : "수정"),
            ),
          ],
        );
      },
    );
  }

  Future<void> _deleteTodo(String id) async {
  print("🗑 삭제하려는 ID: $id"); 
  await _todoService.deleteTodo(id);
  _fetchTodosByDate(_selectedDate);
}


  Future<void> _toggleTodoStatus(Todo todo) async {
    Todo updatedTodo = Todo(
      id: todo.id,
      name: todo.name,
      todoDate: todo.todoDate,
      status: !todo.status,
    );

    await _todoService.updateTodo(updatedTodo);
    _fetchTodosByDate(_selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todo Calendar')),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _selectedDate,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                _calendarFormat = format;
              });
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDate = selectedDay;
              });
              _fetchTodosByDate(selectedDay);
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDate, day);
            },
            eventLoader: (day) => _selectedDate == day ? _todoList : [],
          ),
          Expanded(child: _buildTodoList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addOrUpdateTodo(),
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildTodoList() {
    if (_todoList.isEmpty) {
      return Center(child: Text('No todos for this day'));
    }

    return ListView.builder(
      itemCount: _todoList.length,
      itemBuilder: (context, index) {
        Todo todo = _todoList[index];
        return ListTile(
          leading: Checkbox(
            value: todo.status,
            onChanged: (bool? value) {
              _toggleTodoStatus(todo);
            },
          ),
          title: Text(todo.name, style: TextStyle(decoration: todo.status ? TextDecoration.lineThrough : null)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue),
                onPressed: () => _addOrUpdateTodo(todo: todo),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _deleteTodo(todo.id),
              ),
            ],
          ),
        );
      },
    );
  }
}
