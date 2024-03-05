class SubtaskModel {
  final int? id;
  final String title;
  final bool status;
  final int taskId;

  SubtaskModel({
    this.id,
    required this.title,
    required this.status,
    required this.taskId,
  });

  factory SubtaskModel.fromJson(Map<String, dynamic> json) {
    return SubtaskModel(
      id: json['id'],
      title: json['title'],
      status: json['status'],
      taskId: json['task_id'],
    );
  }
}
