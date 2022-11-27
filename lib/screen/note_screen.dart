import 'package:flutter/material.dart';
import 'package:note_one/utils/note_tile.dart';
import '../models/note_model.dart';
import 'create_new_note.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  Icon cusIcon = const Icon(Icons.search);
  Widget cusText = const Text('NOTE ONE');
  Icon cusBackButton = const Icon(Icons.arrow_back_ios);

  final noteListItem = Note.noteList();

  List<Note> searchResult = [];

  void deleteTask(String id) {
    setState(() {
      searchResult.removeWhere((element) => element.id == id);
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
    List<Note> result = [];
    if (resultKeyword.isEmpty) {
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
                        _runFilter('');
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
                itemCount: searchResult.length,
                itemBuilder: (BuildContext context, int index) {
                  return ToDoTile(
                    note: searchResult[index],
                    taskName: searchResult[index].noteText.toString(),
                    taskDescription:
                        searchResult[index].noteDescription.toString(),
                    deleteTask: (context) =>
                        deleteTask(searchResult[index].id!),
                    editTask: (context) => editTask(index),
                  );
                })
            : const Center(
                child: Text(
                  "No Note Found!",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: SizedBox(
          height: 52,
          width: 150,
          child: Material(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xff6B50FF), // button color
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              splashColor: Colors.deepPurpleAccent, // splash color
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const CreateNewNote();
                    },
                  ),
                ).then(
                  (createNote) {
                    setState(() {
                      searchResult.add(createNote);
                    });
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(
                    Icons.add_circle_outline,
                    color: Colors.white,
                    size: 32,
                  ),
                  SizedBox(width: 12),
                  Text(
                    "New",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
