import 'package:flutter/material.dart';
import 'package:minimal_todo_list_app/util/my_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: const Color(0xffdbd3c7),
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
              hintText: "Add a new task"
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(
                text: "Save",
                onPressed: onSave
              ),
              const SizedBox(width: 10,),
              MyButton(text: "Cancel", onPressed: onCancel),
            ],
          )
        ],),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
