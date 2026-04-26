import 'package:flutter/material.dart';
import 'package:notes_app/model/note_model.dart';

class NoteItem extends StatelessWidget {
  final NoteModel note;
  final VoidCallback onDelete;

  const NoteItem({super.key, required this.note, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20,bottom: 20,left: 12),
      decoration: BoxDecoration(
        color: Color(0xffFFCC80),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text(note.title, style: TextStyle(color: Colors.black,fontSize: 25)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Text(
                note.description,
                style: TextStyle(color: Colors.black54, fontSize: 18),
              ),
            ),
            trailing: IconButton(
              onPressed: onDelete,
              icon: Icon(Icons.delete, color: Colors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Text(note.date, style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }
}
