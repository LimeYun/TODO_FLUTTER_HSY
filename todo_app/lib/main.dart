import 'package:flutter/material.dart';
import 'package:todo_app/screens/calendar_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalendarScreen(),
    );
  }
}

// class TodoHomePage extends StatefulWidget {
//   const TodoHomePage({super.key});

//   @override
//   _TodoHomePageState createState() => _TodoHomePageState();
// }

// class _TodoHomePageState extends State<TodoHomePage> {
//   final TextEditingController _controller = TextEditingController();
//   final List<String> _todos = [];

//   void _addTodo() {
//     if (_controller.text.isNotEmpty) {
//       setState(() {
//         _todos.add(_controller.text);
//         _controller.clear();
//       });
//     }
//   }

//   void _removeTodo(int index) {
//     setState(() {
//       _todos.removeAt(index);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Todo List')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _controller,
//               decoration: const InputDecoration(
//                 labelText: 'Enter a task',
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _addTodo,
//               child: const Text('Add Todo'),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: _todos.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(_todos[index]),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () => _removeTodo(index),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
