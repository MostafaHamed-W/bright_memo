import 'package:flutter/material.dart';
import 'package:notes/views/edit_note_view.dart';

import 'custom_note_item.dart';

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: GestureDetector(
            child: const NoteItem(),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const EditNoteView()));
            },
          ),
        );
      },
      padding: const EdgeInsets.symmetric(vertical: 20),
    );
  }
}
