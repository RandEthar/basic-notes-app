class FirestorePath {
  static String getPath() {
    return 'notes/';
  }

  static String addNote(String id) {
    return 'notes/$id';
  }

  static String deleteNote(String id) {
    return 'notes/$id';
  }
}
