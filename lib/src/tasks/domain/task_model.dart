class TaskModel {
  final int? id;
  final String title;
  final String description;
  final String stage;
  final int weight;
  final String startDate;
  final String dueDate;
  final String? endDate;
  final int? ownerId;
  final int? projectId;
  final int? sprintId;
  final int? milestoneId;

  TaskModel({
    this.id,
    required this.description,
    required this.title,
    required this.stage,
    required this.weight,
    required this.startDate,
    required this.dueDate,
    this.endDate,
    this.ownerId,
    this.projectId,
    this.sprintId,
    this.milestoneId,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        description: json['description'],
        title: json['title'],
        weight: json['weight'],
        stage: json['stage'],
        startDate: json['start_date'],
        dueDate: json['due_date'],
        endDate: json['end_date'],
        ownerId: json['owner_id'],
        projectId: json['project_id'],
        milestoneId: json['milestone_id'],
        sprintId: json['sprint_id']);
  }
}
