import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notes_app/model/note_model.dart';

import '../note_item.dart';

class NotesListView extends StatefulWidget {
  const NotesListView({super.key});

  @override
  State<NotesListView> createState() => _NotesListViewState();
}

class _NotesListViewState extends State<NotesListView> {
  final Box<NoteModel> notesBox = Hive.box<NoteModel>('notes');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ValueListenableBuilder(
        valueListenable: notesBox.listenable(),
        builder: (context, Box<NoteModel> box, _) {
          final notes = box.values.toList().cast<NoteModel>();
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              final note = notes[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: NoteItem(
                  note: note,
                  onDelete: () {
                    note.delete();
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
