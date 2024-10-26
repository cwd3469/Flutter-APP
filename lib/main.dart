import 'package:flutter/material.dart';

void main() {
  runApp(TodoApp());
}

class TodoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Map<String, dynamic>> _todos = []; // Todo 목록을 저장하는 리스트
  final TextEditingController _controller = TextEditingController();

  // Todo 추가 함수
  void _addTodo() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _todos.add({'title': _controller.text, 'isDone': false});
        _controller.clear(); // 입력 필드 초기화
      });
    }
  }

  // Todo 수정 함수
  void _editTodo(int index) {
    _controller.text = _todos[index]['title']; // 기존 텍스트 불러오기
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Todo'),
          content: TextField(controller: _controller),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _todos[index]['title'] = _controller.text;
                });
                _controller.clear();
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                _controller.clear();
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Todo 삭제 함수
  void _deleteTodo(int index) {
    setState(() {
      _todos.removeAt(index);
    });
  }

  // Todo 완료 상태 변경 함수
  void _toggleTodoStatus(int index) {
    setState(() {
      _todos[index]['isDone'] = !_todos[index]['isDone'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(hintText: 'Enter a todo'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTodo,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                final todo = _todos[index];
                return ListTile(
                  title: Text(
                    todo['title'],
                    style: TextStyle(
                      decoration: todo['isDone']
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  leading: Checkbox(
                    value: todo['isDone'],
                    onChanged: (value) => _toggleTodoStatus(index),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editTodo(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTodo(index),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
