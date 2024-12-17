import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minimal_todo_list_app/model/task.dart';
import 'package:minimal_todo_list_app/shared_prefs/shared_prefs.dart';
import 'package:minimal_todo_list_app/util/dialog_box.dart';
import 'package:minimal_todo_list_app/util/todo_tile.dart';

class TopPage extends StatefulWidget {
  final Task? task;
  const TopPage({super.key, this.task});

  @override
  State<TopPage> createState() => _TopPageState();
}

class _TopPageState extends State<TopPage> {
  final SharedPrefs _prefs = SharedPrefs();
  final _controller = TextEditingController();

  // late String _taskTitle;
  late bool _taskCompleted;
  late Task task;

  @override
  void initState() {
    super.initState();
    Future (
            () async {
              () => _prefs.getTask();
        }
    );

    var task = widget.task;
    // _taskTitle = task?.taskName ?? "";
    _taskCompleted = task?.taskCompleted ?? false;

    if(task == null) {
      _taskCompleted = false;
    } else {
      _taskCompleted = true;
      this.task = task;
    }
  }

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void saveNewTask () {
    setState(() {
      _prefs.addTask(_controller.text, _taskCompleted);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      _prefs.deleteTask(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'TODO',
          style: GoogleFonts.roboto(),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body:ListView.builder(
          itemCount: _prefs.count(),
          itemBuilder: (context, index) {
            var item = _prefs.findByIndex(index);
            return TodoTitle(
                taskTitle: item.taskName,
                taskCompleted: item.taskCompleted,
                onChanged: (bool? value) {
                  setState(() => _prefs.updateTask(item, value!));
                },
              deleteFunction: (context) => deleteTask(index),
            );
          },
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        onPressed: createNewTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
