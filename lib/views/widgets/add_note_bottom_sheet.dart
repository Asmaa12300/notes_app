import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/model/note_model.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class AddNoteBottomSheet extends StatefulWidget {
  const AddNoteBottomSheet({super.key});

  @override
  State<AddNoteBottomSheet> createState() => _AddNoteBottomSheetState();
}

class _AddNoteBottomSheetState extends State<AddNoteBottomSheet> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  final Box<NoteModel> notesBox = Hive.box<NoteModel>('notes');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 24,),
            CustomTextField(hintText: 'Title', controller: titleController),
            SizedBox(height: 16,),
            CustomTextField(hintText: 'Content', maxLines: 5, controller: contentController),
            SizedBox(height: 30,),
            CustomButton(
              onPressed: () {
                if (titleController.text.isNotEmpty && contentController.text.isNotEmpty) {
                  final note = NoteModel(
                    title: titleController.text,
                    description: contentController.text,
                    date: DateFormat('MMM dd,yyyy').format(DateTime.now()),
                  );
                  notesBox.add(note);
                  Navigator.pop(context);
                }
              },
            ),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
