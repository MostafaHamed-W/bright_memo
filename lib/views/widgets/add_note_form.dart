import 'package:flutter/material.dart';
import 'package:notes/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes/models/note_model.dart';

import '../../constants.dart';
import 'custom_text_field.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  bool isLoading = false;
  String? title, subTitle;
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          const SizedBox(height: 35),
          CustomTextField(
            hint: "Title",
            maxLines: 1,
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hint: "Content",
            maxLines: 6,
            onSaved: (value) {
              subTitle = value;
            },
          ),
          // const Spacer(),
          const SizedBox(
            height: 32,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: BlocBuilder<AddNoteCubit, AddNoteState>(
              builder: (BuildContext context, state) {
                state is AddNoteLoading ? isLoading = true : isLoading = false;
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: kPrimaryColor,
                  ),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                          title: title!,
                          subTitle: subTitle!,
                          date: DateTime.now().toString(),
                          color: Colors.blue.value);
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                    } else {
                      autovalidateMode = AutovalidateMode.always;

                      setState(() {});
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isLoading
                          ? const CircularProgressIndicator()
                          : const Text(
                              "Add",
                              style: TextStyle(color: Colors.black),
                            ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
