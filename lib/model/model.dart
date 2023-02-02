
class TodoModel {
  TodoModel({
    required this.data,
  });

  List<Data> data;

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Data {
  Data({
    required this.title,
    required this.description,
    required this.date,
    required this.status,
  });

  String title;
  String description;
  String date;
  String status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"],
    description: json["description"],
    date: json["date"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "date": date,
    "status": status,
  };
}
