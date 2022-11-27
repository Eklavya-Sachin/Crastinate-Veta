import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../models/note_model.dart';
import '../screen/show_note.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final Note note;
  final String taskName;
  final String taskDescription;
  Function(BuildContext)? editTask;
  Function(BuildContext)? deleteTask;

  ToDoTile({
    Key? key,
    required this.note,
    required this.taskName,
    required this.editTask,
    required this.deleteTask,
    required this.taskDescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 25.0, right: 25, top: 13, bottom: 13),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const DrawerMotion(),
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              foregroundColor: Colors.white,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editTask,
              icon: Icons.edit,
              foregroundColor: Colors.white,
              backgroundColor: Colors.greenAccent,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ShowNote(
                note: note,
              ),
            ),
          ),
          child: Container(
            height: 95,
            width: 364,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(39, 45, 64, 0.28),
              borderRadius: BorderRadius.circular(17),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: taskDescription.isNotEmpty
                      ? const EdgeInsets.only(left: 29, top: 10)
                      : const EdgeInsets.only(left: 29, top: 20),
                  child: Text(
                    taskName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: taskDescription.isNotEmpty
                      ? const EdgeInsets.only(
                          left: 29, top: 8, bottom: 13, right: 20)
                      : const EdgeInsets.all(0),
                  child: Text(
                    taskDescription,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
