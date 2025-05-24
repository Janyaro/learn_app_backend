class Todomodel {
  final String title;
  final String description;

  Todomodel({required this.title, required this.description});

  factory Todomodel.fromJson(Map<String, dynamic> json) {
    return Todomodel(
      title: json['title'],
      description: json['description'],
    );
  }
}
