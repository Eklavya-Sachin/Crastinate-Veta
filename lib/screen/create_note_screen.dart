import 'package:flutter/material.dart';

class CreateNoteScreen extends StatefulWidget {
  const CreateNoteScreen({Key? key}) : super(key: key);

  @override
  State<CreateNoteScreen> createState() => _CreateNoteScreenState();
}

class _CreateNoteScreenState extends State<CreateNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFF1E1E1E),
          leading: const BackButton()),
      body: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Text(
                "Title",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                'Description',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w300),
              )
            ],
          )),
    );
  }
}
