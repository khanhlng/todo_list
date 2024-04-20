import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  List<TodoListItem> items = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
      ),
      body: Column(
        children: [
          _actionBar(),
          _todoList(),
        ],
      ),
    );
  }

  Widget _actionBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            onPressed: _addGrocery, child: const Text('Add Grocery')),
        ElevatedButton(
            onPressed: _learnEnglish, child: const Text('Learn English')),
      ],
    );
  }

  Widget _todoList() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: items,
    );
  }

  void _addGrocery() {
    print('Add grocery');
    setState(() {
      items.add(
        TodoListItem('Buy Groceries'),
      );
    });
  }

  void _learnEnglish() {
    print('Learn english');
    setState(() {
      items.add(TodoListItem('Learn English'));
    });
  }
}

class TodoListItem extends StatelessWidget {
  final String name;

  TodoListItem(this.name);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        name,
        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(DateFormat.yMMMd().format(DateTime.now())),
    );
  }
}
