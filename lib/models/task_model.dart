
class TaskModel{
  String title;
  bool isDone;

  TaskModel({
    required this.title,
    this.isDone=false,
  });

  void toggleDone(){
    isDone=!isDone;
  }
}