import 'package:flutter/material.dart';
import '../models/note_model.dart';

class ShowNote extends StatelessWidget {
  const ShowNote({Key? key, required this.note}) : super(key: key);

  final Note note;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1E1E1E),
          leading: const BackButton()),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            children: [
              Text(
                note.noteText.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 50),
              Text(
                note.noteDescription.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              )
            ],
          )),
    );
  }
}
