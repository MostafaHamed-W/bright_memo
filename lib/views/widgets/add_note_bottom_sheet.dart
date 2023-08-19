import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import 'add_note_form.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    // in this case when we open the bottom sheet the cubit created
    // and when close the bottom sheet the cubit closed ,
    //in first case when we put the *BlocProvider* in the main
    // the cubit created but never closed
    return BlocProvider(
      create: (BuildContext context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
        if (state is AddNoteFailure) {
          debugPrint("note failed to add ${state.errMessage}");
        }
        if (state is AddNoteSuccess) {
          BlocProvider.of<NotesCubit>(context).fetchAllNotes();
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        debugPrint('ui rebuild');

        return AbsorbPointer(
          absorbing: state is AddNoteLoading ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: const SingleChildScrollView(
              child: AddNoteForm(),
            ),
          ),
        );
      }),
    );
  }
}
