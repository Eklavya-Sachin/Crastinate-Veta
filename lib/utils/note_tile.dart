
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:note_one/screen/input_note_detail_screen.dart';

// ignore: must_be_immutable
class ToDoTile extends StatelessWidget {
  final String taskName;

  Function(BuildContext)? deleteFunction;

  ToDoTile({
    Key? key,
    required this.taskName,
    required this.deleteFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(39, 45, 64, 0.28),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const NewScreen()));
              },
              // leading: const CircleAvatar(),
              title: Text(
                taskName,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w700),
              ),

              subtitle: const Text(
                'Description',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
              ),
            )),
      ),
    );
  }
}
