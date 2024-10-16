import 'dart:ffi';

class MyDataModel {
  late Int id;
  late Int userid;
  late String title;
  late String body;

  MyDataModel({required id, required userid, required title, required body});

  factory MyDataModel.fromJson(Map<String, dynamic> json) {
    return MyDataModel(
      userid: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
