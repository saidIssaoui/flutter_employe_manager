class TaskModel {
  final String uid,
      employuid,
      name,
      avatar,
      job,
      status,
      taskName,
      clientName,
      start,
      end,
      duration;

  double progress;
  int taskNumber;

  static List<TaskModel> data = [];

  TaskModel({
    this.uid = '',
    this.employuid = '',
    this.name = '',
    this.avatar = '',
    this.job = '',
    this.taskNumber = 0,
    this.status = '',
    this.taskName = '',
    this.clientName = '',
    this.start = '',
    this.end = '',
    this.duration = '',
    this.progress = 0,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      progress: json['progress'],
    );
  }
}
