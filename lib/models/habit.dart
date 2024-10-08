class Habit {
  String title;
  bool isCompleted;

  Habit({required this.title, this.isCompleted = false});

  factory Habit.fromJson(Map<String, dynamic> json) {
    return Habit(
      title: json['title'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isCompleted': isCompleted,
    };
  }
}
