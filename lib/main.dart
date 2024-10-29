import 'package:basic_notes_app/firebase_options.dart';
import 'package:basic_notes_app/logic/cubit/notes_cubit_cubit.dart';
import 'package:basic_notes_app/views/screens/home_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(BlocProvider(
   create: (context) => NotesCubitCubit()..getNote(),
    child: const BasicNotesApp(),
  ));
}

class BasicNotesApp extends StatelessWidget {
  const BasicNotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
