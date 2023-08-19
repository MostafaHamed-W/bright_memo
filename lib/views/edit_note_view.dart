import 'package:bright_memo/views/widgets/edit_note_view_body.dart';
import 'package:flutter/material.dart';

import '../models/note_model.dart';

class EditNoteView extends StatelessWidget {
  final NoteModel note;
  const EditNoteView({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EditNoteViewBody(note: note),
    );
  }
}
