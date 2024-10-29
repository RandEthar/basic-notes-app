import 'package:basic_notes_app/logic/cubit/notes_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Add Note"),
                content:  Form(
                  key: context.read<NotesCubitCubit>().formKey,
                  child: TextFormField(
                autovalidateMode:AutovalidateMode.onUserInteraction ,
                    validator: (value) {
                      if(value==null||value.isEmpty){
                        return 'please enter some text!';
                      }else{
                        return null;
                      }
                    },
                    controller: context.read<NotesCubitCubit>().textController,
                               
                    decoration: const InputDecoration(hintText: 'Enter your note'),
                  ),
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        context.read<NotesCubitCubit>().textController.clear();
                      },
                      child: const Text("cancle")),
                  TextButton(
                      onPressed: () {
                        if(context.read<NotesCubitCubit>().formKey.currentState!.validate()){
                        Navigator.of(context).pop();
                     
                            context.read<NotesCubitCubit>().addNote();
                        }
                      },
                      child: const Text("add"))
                ],
              );
            });
      },
      child: const Icon(Icons.add),
    );
  }
}
