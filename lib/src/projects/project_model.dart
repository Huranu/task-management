class ProjectModel {
  final int id;
  final String title;
  final String description;
  final String startDate;
  final String dueDate;
  final String? endDate;

  ProjectModel({
    required this.id,
    required this.description,
    required this.title,
    required this.startDate,
    required this.dueDate,
    this.endDate,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    return ProjectModel(
      id: json['id'],
      description: json['description'],
      title: json['title'],
      startDate: json['start_date'],
      dueDate: json['due_date'],
      endDate: json['end_date'],
    );
  }
}
