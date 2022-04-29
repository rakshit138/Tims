import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:mad_project/attendance/create_sheet_attend.dart';
import 'package:mad_project/attendance/modify_sheets_attend.dart';

// class TodoApp extends StatelessWidget {
//   const TodoApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return TodoList();
//   }
// }
final List<String> _ClassItems = [];

class ClassList2 extends StatefulWidget {
  const ClassList2({Key? key}) : super(key: key);

  @override
  createState() => ClassList2State();
}

class ClassList2State extends State<ClassList2> {
  void _addClassItem(String task) {
    if (task.isNotEmpty) {
      setState(() => _ClassItems.add(task));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFFEC9454)),
        title: const Text('Class List'),
        backgroundColor: Color(0xFF8E334C),
      ),
      body: _buildClassList(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              color: Color(0xFF8E334C),
              onPressed: _pushAddClassScreen, //_pushAddTodoScreen
              child: const Icon(
                Icons.add,
                color: Color(0xFFEC9454),
              )),
        ],
      ),
    );
  }

  void _pushAddClassScreen() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            iconTheme: IconThemeData(color: Color(0xFFEC9454)),
            title: const Text('Add New Class '),
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
                _addClassItem(val);
              });

              Navigator.pop(context);
            },
            decoration: const InputDecoration(
                hintText: 'Enter Class Name',
                contentPadding: EdgeInsets.all(16.0)),
          ));
    }));
  }

  void _removeClassItem(int index) {
    setState(() {
      _ClassItems.removeAt(index);
    });
  }

  void _promptRemoveClassItem(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              //title: Text('Mark "${_todoItems[index]}" as done?'),
              title: const Text("Remove Class?"),
              actions: <Widget>[
                MaterialButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("Cancel")),
                MaterialButton(
                    child: const Text("OK"),
                    onPressed: () {
                      _removeClassItem(index);
                      Navigator.of(context).pop();
                    }),
              ]);
        });
  }

  Widget _buildClassList() {
    return ListView.builder(
      itemCount: _ClassItems.length,
      itemBuilder: (context, index) {
        // if (index < _todoItems.length) {
        //   return _buildTodoItem(_todoItems[index], index);
        // }_
        return _buildClassItem(_ClassItems[index], index);
      },
    );
  }

  void _showBottomModal() {
    final CreateButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 4,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CreateSheetPageAttend()));
          },
          child: Text(
            "Create",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFEC9454),
                fontWeight: FontWeight.bold),
          )),
    );
    final ModifyButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 4,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ModifySheetsPageAttend()));
          },
          child: Text(
            "Modify",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFEC9454),
                fontWeight: FontWeight.bold),
          )),
    );

    final CloseBottomSheetButton = Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(30),
      color: Color(0xFF8E334C),
      child: MaterialButton(
          padding: EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width / 2,
          height: MediaQuery.of(context).size.width / 4,
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Back",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFFEC9454),
                fontWeight: FontWeight.bold),
          )),
    );

    showModalBottomSheet(
      context: context,
      backgroundColor: Color(0xFFEC9454),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(20), child: CreateButton)),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(20), child: ModifyButton)),
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CloseBottomSheetButton,
                ))
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildClassItem(String ClassText, int index) {
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
                ClassText,
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
              onTap: () => _showBottomModal(),
              onLongPress: () => _promptRemoveClassItem(index)),
          Divider(
            thickness: 2,
            color: Color(0xFF8E334C),
          )
        ],
      ),
    );
  }
}
