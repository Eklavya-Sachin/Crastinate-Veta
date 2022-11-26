import 'package:flutter/material.dart';
import '../models/note_model.dart';

class ShowNote extends StatelessWidget {
   ShowNote({Key? key}) : super(key: key);
 
  final noteListItem = Note.noteList();


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
            children:  [
              Text(
               'Title',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
               "desription",
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
