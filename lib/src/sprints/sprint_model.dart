class SprintModel {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String dueDate;
  final String? endDate;
  final int projectId;
  final int? milestoneId;

  SprintModel({
    required this.id,
    required this.description,
    required this.title,
    required this.startDate,
    required this.dueDate,
    this.endDate,
    required this.projectId,
    this.milestoneId,
  });

  factory SprintModel.fromJson(Map<String, dynamic> json) {
    return SprintModel(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      startDate: json['start_date'],
      dueDate: json['due_date'],
      endDate: json['end_date'],
      projectId: json['project_id'],
      milestoneId: json['milestone_id'],
    );
  }
}
