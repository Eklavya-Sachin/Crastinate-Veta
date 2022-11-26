import 'package:flutter/material.dart';
import '../screen/create_new_note.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      width: 150,
      child: Material(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xff6B50FF), // button color
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          splashColor: Colors.deepPurpleAccent, // splash color
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const CreateNewNote())), // button pressed
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
    );
  }
}
