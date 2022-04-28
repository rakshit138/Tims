import 'package:flutter/material.dart';
import 'package:mad_project/reminder.dart';

// class TodoApp extends StatelessWidget {
//   const TodoApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TodoList();
//   }
// }
final List<String> _todoItems = [];

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  void _addTodoItem(String task) {
    if (task.isNotEmpty) {
      setState(() => _todoItems.add(task));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFEC9454)),
        title: const Text('Todo List'),
        backgroundColor: Color(0xFF8E334C),
      ),
      body: _buildTodoList(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Color(0xFF8E334C),
              onPressed: _pushAddTodoScreen, //_pushAddTodoScreen
              child: const Icon(
                Icons.add,
                color: Color(0xFFEC9454),
              )),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Color(0xFF8E334C),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));
              }, //_pushAddTodoScreen
              child: const Icon(
                Icons.alarm_add_rounded,
                color: Color(0xFFEC9454),
              )),
        ],
      ),
    );
  }

  void _pushAddTodoScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xFFEC9454)),
            title: const Text('Add New Task '),
            backgroundColor: Color(0xFF8E334C),
          ),
          body: TextField(
            style: TextStyle(
              color: Colors.teal[900],
              fontSize: 19,
            ),
            autofocus: true,
            onSubmitted: (val) {
              setState(() {
                _addTodoItem(val);
              });

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                hintText: 'Enter something to do...',
                contentPadding: EdgeInsets.all(16.0)),
          ));
    }));
  }

  void _removeTodoItem(int index) {
    setState(() {
      _todoItems.removeAt(index);
    });
  }

  void _promptRemoveTodoItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              //title: Text('Mark "${_todoItems[index]}" as done?'),
              title: const Text("Remove task?"),
              actions: <Widget>[
                MaterialButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel")),
                MaterialButton(
                    child: const Text("OK"),
                    onPressed: () {
                      _removeTodoItem(index);
                      Navigator.of(context).pop();
                    }),
              ]);
        });
  }

  Widget _buildTodoList() {
    return ListView.builder(
      itemCount: _todoItems.length,
      itemBuilder: (context, index) {
        // if (index < _todoItems.length) {
        //   return _buildTodoItem(_todoItems[index], index);
        // }_
        return _buildTodoItem(_todoItems[index], index);
      },
    );
  }

  Widget _buildTodoItem(String todoText, int index) {
    return Container(
      //decoration: BoxDecoration(border: Border.all(color: Color(0xFF8E334C))),
      child: Column(
        children: [
          ListTile(
              leading: CircleAvatar(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(
                      color: Color(0xFF8E334C), fontWeight: FontWeight.w400),
                ),
                backgroundColor: Color(0xFFEC9454),
              ),
              title: Text(
                todoText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                ),
              ),
              trailing: const Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onTap: () => _promptRemoveTodoItem(index)),
          Divider(
            thickness: 2,
            color: Color(0xFF8E334C),
          )
        ],
      ),
    );
  }
}
