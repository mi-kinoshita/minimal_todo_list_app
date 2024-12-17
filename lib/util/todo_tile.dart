import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTitle extends StatelessWidget {
  late String taskTitle;
  late bool taskCompleted;
  Function(bool?) onChanged;
  Function(BuildContext)? deleteFunction;

  TodoTitle({
    super.key,
    required this.taskTitle,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25, top: 25),
      child: Slidable(
        endActionPane: ActionPane(
            motion: const StretchMotion(),
            children: [
              SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.delete,
                backgroundColor: Theme.of(context).colorScheme.error,
              )
            ],
        ),
        child: Container(
          decoration : BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
          ),
          child: Row(
            children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              // activeColor: const Color(0xff585450),
              // checkColor: Colors.white,
                ),
            Text(taskTitle),
          ]),
        ),
      ),
    );
  }
}
