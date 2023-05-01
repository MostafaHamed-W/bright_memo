import 'package:flutter/cupertino.dart';
import 'package:notes/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: const [
          SizedBox(height: 35),
          CustomTextField(
            hint: "Title",
            maxLines: 1,
          ),
          SizedBox(height: 20),
          CustomTextField(
            hint: "Content",
            maxLines: 6,
          ),
        ],
      ),
    );
  }
}
