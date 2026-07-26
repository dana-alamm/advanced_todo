
// class TaskModel{
//   String title;
//   bool isDone;

//   TaskModel({
//     required this.title,
//     this.isDone=false,
//   });

//   void toggleDone(){
//     isDone=!isDone;
//   }
//   factory TaskModel.fromJson(Map<String, dynamic> json) {
//     return TaskModel(
//       title: json['title'],
//       isDone: json['isDone'] ?? false, 
//     );
//   }
//   Map<String, dynamic> toJson() {
//     return {
//       'title': title,
//       'isDone': isDone,
//     };
//   }
// }
class TaskModel {
  String title;
  bool isDone;

  TaskModel({
    required this.title,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      title: json['title'],
      isDone : json['isDone'] ?? false, 
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'isDone': isDone,
    };
  }

  
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModel &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          isDone == other.isDone;

  @override
  int get hashCode => title.hashCode ^ isDone.hashCode;
}