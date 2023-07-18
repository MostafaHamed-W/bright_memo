import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/constants.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/simple_bloc_observer.dart';
import 'package:notes/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(
      NoteModelAdapter()); // regestering type adapter - we should register adapter first
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "Poppins",
          brightness: Brightness.dark,
          // scaffoldBackgroundColor: Colors.black,
        ),
        home: const NotesView(),
      ),
    );
  }
}
