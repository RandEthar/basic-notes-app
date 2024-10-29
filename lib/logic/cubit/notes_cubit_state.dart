part of 'notes_cubit_cubit.dart';

@immutable
sealed class NotesCubitState {}

final class NotesCubitInitial extends NotesCubitState {}

final class NoteLoading extends NotesCubitState {}

final class NoteSuccess extends NotesCubitState {}

final class NoteFailure extends NotesCubitState {}

final class GetNoteLoading extends NotesCubitState {}

final class GetNoteSuccess extends NotesCubitState {
  final List<NoteModel> notes;

  GetNoteSuccess({required this.notes});
}
final class GetNoteFailure extends NotesCubitState {}
final class DeleteNoteLoading extends NotesCubitState {}
final class DeleteNoteSuccess extends NotesCubitState {}
final class DeleteNoteFailure extends NotesCubitState {}