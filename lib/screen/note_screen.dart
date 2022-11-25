import 'package:flutter/material.dart';
import 'package:note_one/utils/custom_buttom.dart';
import 'package:note_one/utils/note_tile.dart';

import '../models/note_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final _controller = TextEditingController();

  Icon cusIcon = const Icon(Icons.search);
  Widget cusText = const Text('NOTE ONE');
  Icon cusBackButton = const Icon(Icons.arrow_back_ios);

  final noteListItem = Note.noteList();

  List searchResult = [];

  void saveNewTask() {
    setState(() {
      noteListItem.add(_controller.text);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      noteListItem.removeAt(index);
    });
  }

  void editTask(int index) {
    setState(() {});
  }

  @override
  void initState() {
    searchResult = noteListItem;
    super.initState();
  }

  void _runFilter(String resultKeyword) {
    List result = [];
    if (result.isEmpty) {
      result = noteListItem;
    } else {
      result = noteListItem
          .where((element) => element.noteText!
              .toString()
              .toLowerCase()
              .contains(resultKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      searchResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 27, 27, 36),
          appBar: AppBar(
            leadingWidth: 80,
            titleSpacing: 0,
            leading: cusBackButton,
            elevation: 0,
            backgroundColor: const Color.fromARGB(255, 27, 27, 36),
            title: cusText,
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 28),
                child: IconButton(
                  icon: cusIcon,
                  onPressed: () {
                    setState(
                      () {
                        if (cusIcon.icon == Icons.search) {
                          cusBackButton = const Icon(Icons.search);
                          cusIcon = const Icon(Icons.clear);
                          cusText = TextField(
                            onChanged: (value) => _runFilter(value),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search your Note",
                              hintStyle: TextStyle(color: Colors.white),
                            ),
                            style: const TextStyle(color: Colors.white),
                          );
                        } else {
                          cusIcon = const Icon(Icons.search);
                          cusText = const Text('NOTE ONE');
                          cusBackButton = const Icon(Icons.arrow_back_ios);
                        }
                      },
                    );
                  },
                ),
              )
            ],
          ),
          body: searchResult.isNotEmpty
              ? ListView.builder(
                  itemCount: noteListItem.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ToDoTile(
                      taskName: noteListItem[index].toString(),
                      deleteTask: (context) => deleteTask(index),
                      editTask: (context) => editTask(index),
                    );
                  })
              : const Text("No Note Found!"),
          // : Text('No Result Found!'),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: const CustomButton()),
    );
  }
}
