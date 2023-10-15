class TaskModel {
  String id;
  String title;
  String description;
  int date;
  bool isDone;

  TaskModel(
      { this.id="",
      required this.title,
      required this.description,
      required this.date,
       this.isDone=false});

// بتاخد ماب وبترجع موديل
  /*TaskModel fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        date: json['date'],
        isDone: json['isDone']);
  }*/

  ///or named constructor
  TaskModel.fromData(Map<String, dynamic> data)
      : this(
            id: data['Id'],
            title: data['Title'],
            description: data['Description'],
            date: data['Date'],
            isDone: data['IsDone']);

  Map<String,dynamic> toData(){

    return {
     "Id": id,
      "Title":title,
      "Description":description,
      "Date":date,
      "IsDone": isDone
    };

  }
}
