class Task {
  int? id;
  String name;
  String description;
  DateTime dateTime;
  String priority; // "High", "Average", "Low"
  bool isCompleted;

  Task({
    this.id,
    required this.name,
    required this.description,
    required this.dateTime,
    required this.priority,
    this.isCompleted = false,
  });

  // Convert a Task into a Map. Used for inserting/updating data.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'dateTime': dateTime.toIso8601String(),
      'priority': priority,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  // Convert a Map into a Task. Used for reading data.
  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      dateTime: DateTime.parse(map['dateTime']),
      priority: map['priority'],
      isCompleted: map['isCompleted'] == 1,
    );
  }

  // Add copyWith method to make task modifications easier
  Task copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? dateTime,
    String? priority,
    bool? isCompleted,
  }) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
