import 'package:basic_notes_app/model/note_model.dart';
import 'package:basic_notes_app/services/home_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'notes_cubit_state.dart';

class NotesCubitCubit extends Cubit<NotesCubitState> {
  NotesCubitCubit() : super(NotesCubitInitial());
  final TextEditingController textController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  HomeServicesImpl homeServicesImpl = HomeServicesImpl();
  void addNote() async {
    try {
      emit(NoteLoading());
      final textContent = textController.text;
      await homeServicesImpl.addNote(
          notes: NoteModel(id: NoteModel.generateId(), content: textContent));
      textController.clear();
      emit(NoteSuccess());
      getNote();
    } catch (e) {
      emit(NoteFailure());
    }
  }

  void deleteNote({required String id}) async {
    try {
      emit(DeleteNoteLoading());
      await homeServicesImpl.deleteNote(id: id);
      emit(DeleteNoteSuccess());
        getNote();
    } catch (e) {
      emit(DeleteNoteFailure());
    }
  }

  void getNote() async {
    try {
      emit(GetNoteLoading());
      final notes = await homeServicesImpl.getHomeData();
      print("Notes fetched: ${notes.length}"); // تأكيد استرجاع البيانات
      emit(GetNoteSuccess(notes: notes));
    } catch (e) {
      emit(GetNoteFailure());
    }
  }
}
