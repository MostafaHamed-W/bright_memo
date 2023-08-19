import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../constants.dart';
import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'custom_text_field.dart';
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
            height: 16,
          ),
          const ColorsListView(),
          const SizedBox(
            height: 16,
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
                      // format date time
                      var currentDate = DateTime.now();
                      // debugPrint('$currentDate');
                      var formattedDate = DateFormat.yMd().format(currentDate);
                      // debugPrint(formattedDate);
                      formKey.currentState!.save();
                      var noteModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedDate,
                        color: Colors.blue.value,
                      );
                      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                      BlocProvider.of<NotesCubit>(context).fetchAllNotes();
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

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.noteColor});
  final bool isActive;
  final Color noteColor;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: noteColor,
            ),
          )
        : CircleAvatar(
            backgroundColor: noteColor,
            radius: 30,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currnetIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
          itemCount: kNoteColors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    currnetIndex = index;
                    BlocProvider.of<AddNoteCubit>(context).noteColor = kNoteColors[index];
                  });
                },
                child: ColorItem(
                  isActive: currnetIndex == index,
                  noteColor: kNoteColors[index],
                ),
              ),
            );
          }),
    );
  }
}
