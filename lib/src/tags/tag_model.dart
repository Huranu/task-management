class TagModel {
  final int id;
  final String title;
  final String color;

  TagModel({
    required this.id,
    required this.title,
    required this.color,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: json['id'],
      title: json['title'],
      color: json['color'],
    );
  }
}
