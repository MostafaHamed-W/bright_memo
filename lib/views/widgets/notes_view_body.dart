import 'package:flutter/material.dart';
import 'package:notes/constants.dart';
import 'custom_app_bar.dart';
import 'custom_note_item.dart';

class NotesViewBody extends StatelessWidget {
  const NotesViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: const [
          SizedBox(height: 60),
          CustomAppBar(),
          SizedBox(height: 30),
          NoteItem(),
          SizedBox(
            height: 10,
          ),
          NoteItem(),
        ],
      ),
    );
  }
}
