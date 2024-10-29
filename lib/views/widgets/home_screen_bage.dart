import 'package:basic_notes_app/logic/cubit/notes_cubit_cubit.dart';
import 'package:basic_notes_app/utils/healpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreenBage extends StatelessWidget {
  const HomeScreenBage({super.key});
  //"Note added Successfully"
  //"Failed to added note"
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubitCubit, NotesCubitState>(
      listener: (context, state) {
        if (state is NoteSuccess) {
          buildListener(context, "Note added Successfully");
          //  context.read<NotesCubitCubit>().getNote();
        } else if (state is NoteFailure) {
          buildListener(context, "Failed to added note");
        } else if (state is DeleteNoteSuccess) {
          buildListener(context, "Note Deleted Successfully");
        }
        else if (state is GetNoteFailure) {
          buildListener(context, "Failed to added note");
        }
      },
      builder: (context, state) {
        if (state is GetNoteSuccess) {
          final notes = state.notes;
          return ListView.builder(
              itemCount: notes.length,
              itemBuilder: (context, index) {
                final note = notes[index];
                return ListTile(
                  title: Text(note.content),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<NotesCubitCubit>().deleteNote(id:note.id);



                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                );
              });
        } else if (state is NoteLoading || state is GetNoteLoading ||state is DeleteNoteLoading ) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("No Notes Found!"));
        }
      },
    );
  }
}
