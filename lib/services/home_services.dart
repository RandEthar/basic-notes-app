import 'package:basic_notes_app/model/note_model.dart';
import 'package:basic_notes_app/services/custom_firestore_services.dart';
import 'package:basic_notes_app/utils/firestore_path.dart';

abstract class HomeServices {
  Future<List<NoteModel>> getHomeData();
  Future<void> addNote({required NoteModel notes});
  Future<void> deleteNote({required String id});
}

class HomeServicesImpl implements HomeServices {
  final CustomFirestoreServices customFirestoreServices=CustomFirestoreServices();

  @override
   Future<void>addNote({required NoteModel notes})async{
   await customFirestoreServices.addNote(
      path: FirestorePath.addNote(notes.id),
     data: notes.toMap());
   }
  

  @override
  Future<void> deleteNote({required String id})async {
   await customFirestoreServices.deleteNote(path: FirestorePath.deleteNote(id));
  }

  @override
 Future<List<NoteModel>> getHomeData()async {
   final notes=await  customFirestoreServices.getNote(path:FirestorePath.getPath());
   return notes.map((e){
    return NoteModel.fromMap(e);
   }).toList();
  }
}
