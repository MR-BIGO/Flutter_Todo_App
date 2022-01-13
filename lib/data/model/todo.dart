class Todo {
  int id;
  String title;
  bool isDone;
  String description;

  Todo({
    required this.id,
    required this.title,
    required this.isDone,
    required this.description,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      title: json['todo'],
      isDone: json['isDone'],
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['todo'] = title;
    data['isDone'] = false;
    data['description'] = description;
    return data;
  }
}
