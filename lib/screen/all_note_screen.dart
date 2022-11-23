import 'package:flutter/material.dart';
import 'package:note_one/utils/note_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      noteList.add(_controller.text);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      noteList.removeAt(index);
    });
  }

  void editFunction(BuildContext context) {}

  List noteList = ["make App", "Build Flutter"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.search,
                )),
          )
        ],
        leading: const BackButton(),
        elevation: 0,
        backgroundColor: const Color(0xFF1E1E1E),
        title: const Text(
          'NOTE ONE',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: noteList.length,
          itemBuilder: (BuildContext context, int index) {
            return ToDoTile(
              taskName: noteList[index].toString(),
              deleteFunction: (context) => deleteTask(index),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        backgroundColor: Colors.deepPurpleAccent,
        label: const Text('New'),
        // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(20)),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
