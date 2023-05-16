import 'package:flutter/material.dart';
import 'package:notes/views/widgets/custom_app_bar.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 60),
          CustomAppBar(
            title: "Edit Note",
            icon: Icons.edit,
          ),
        ],
      ),
    );
  }
}
