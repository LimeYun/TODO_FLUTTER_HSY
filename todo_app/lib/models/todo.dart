class Todo {
  final String id;
  final String name;
  final String todoDate;
  final bool status;

  Todo({required this.id, required this.name, required this.todoDate, required this.status});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'].toString(),
      name: json['name'],
      todoDate: json['todoDate'],
      status: json['status'],  
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'status': status,
      'todoDate': todoDate,
    };
  }
}