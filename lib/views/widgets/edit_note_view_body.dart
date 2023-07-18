import 'package:flutter/material.dart';
import 'package:notes/cubits/notes_cubit/notes_cubit.dart';
import 'package:notes/models/note_model.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({super.key, required this.note});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;
  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 60),
          CustomAppBar(
            onPressed: () {
              if (isEditing == true) {
                widget.note.title = title ?? widget.note.title;
                widget.note.subTitle = content ?? widget.note.subTitle;
                widget.note.save();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              } else {
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
            },
            title: "Edit Note",
            icon: isEditing ? Icons.check : Icons.close,
          ),

          const SizedBox(height: 35),
          CustomTextField(
            hint: widget.note.title,
            maxLines: 1,
            onChanged: (value) {
              title = value;
              setState(() {
                title!.isNotEmpty || content!.isNotEmpty ? isEditing = true : isEditing = false;
              });
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hint: widget.note.subTitle,
            maxLines: 6,
            onChanged: (value) {
              content = value;
              setState(() {
                title!.isNotEmpty || content!.isNotEmpty ? isEditing = true : isEditing = false;
              });
            },
          ),
          // const Spacer(),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
