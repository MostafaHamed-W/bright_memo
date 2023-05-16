import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/constants.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kNotesBox);
  Hive.registerAdapter(NoteModelAdapter()); // regestering type adapter
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Poppins",
        brightness: Brightness.dark,
        // scaffoldBackgroundColor: Colors.black,
      ),
      home: const NotesView(),
    );
  }
}
