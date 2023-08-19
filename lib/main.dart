import 'package:bright_memo/simple_bloc_observer.dart';
import 'package:bright_memo/views/notes_view.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'cubits/notes_cubit/notes_cubit.dart';
import 'models/note_model.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(
      NoteModelAdapter()); // regestering type adapter - we should register adapter first
  await Hive.openBox<NoteModel>(kNotesBox);
  runApp(const BrightMemo());
}

class BrightMemo extends StatelessWidget {
  const BrightMemo({super.key});

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
