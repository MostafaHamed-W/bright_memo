import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocConsumer<AddNoteCubit, AddNoteState>(
          listener: (context, state) {
            if (state is AddNoteFailure) {
              print("note failed to add ${state.errMessage}");
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoading ? true : false, child: const AddNoteForm());
          },
        ),
      ),
    );
  }
}
