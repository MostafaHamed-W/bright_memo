import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../constants.dart';
import '../../cubits/notes_cubit/notes_cubit.dart';
import '../../models/note_model.dart';
import 'add_note_form.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatefulWidget {
  final NoteModel note;
  const EditNoteViewBody({super.key, required this.note});

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          const SizedBox(height: 60),
          CustomAppBar(
            isEditingPage: true,
            onPressed: () {
              widget.note.title = title ?? widget.note.title;
              widget.note.subTitle = content ?? widget.note.subTitle;
              widget.note.save();
              BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              Navigator.pop(context);
            },
            title: "Edit Note",
            icon: Icons.check,
          ),

          const SizedBox(height: 35),
          CustomTextField(
            hint: widget.note.title,
            maxLines: 1,
            onChanged: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            hint: widget.note.subTitle,
            maxLines: 6,
            onChanged: (value) {
              content = value;
            },
          ),
          // const Spacer(),
          const SizedBox(
            height: 16,
          ),
          EditNoteColorsList(
            note: widget.note,
          )
        ],
      ),
    );
  }
}

class EditNoteColorsList extends StatefulWidget {
  const EditNoteColorsList({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteColorsList> createState() => _EditNoteColorsListState();
}

class _EditNoteColorsListState extends State<EditNoteColorsList> {
  late int currnetIndex;

  @override
  void initState() {
    currnetIndex = kNoteColors.indexOf(Color(widget.note.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: kNoteColors.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currnetIndex = index;
                  widget.note.color = kNoteColors[index].value;
                });
              },
              child: ColorItem(
                isActive: currnetIndex == index,
                noteColor: kNoteColors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
