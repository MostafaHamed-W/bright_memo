import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes/constants.dart';

import '../../models/note_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote(NoteModel note) async {
    emit(AddNoteLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);

      emit(AddNoteSuccess());
    } on Exception catch (e) {
      emit(AddNoteFailure(e.toString()));
    }
  }

// Generic - i can make a type t , in this case the add function can deal with any thing with any type|
// if it takes int it can deal with it , or if it took any type it can deal with it
  // add<T>(T name) {
  //   //
  // }
}
