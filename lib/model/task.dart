class Task {
  late int id;
  late String taskName;
  late bool taskCompleted;
  // Function(bool?)? onChanged;

  Task (
    this.id,
    this.taskName,
    this.taskCompleted,
    // this.onChanged,
  );

  // データをJsonからMapへ変換して保存
  Task.fromJson(Map json) {
    id = json['id'];
    taskName = json['taskName'];
    taskCompleted = json['taskCompleted'];
  }

  //　データをMapからJsonへ変換して取り出す
  toJson() {
    return {
      'id': id,
      'taskName': taskName,
      'taskCompleted': taskCompleted,
    };
  }
}