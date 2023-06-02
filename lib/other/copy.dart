// To parse this JSON data, do
//
//     final toDoMedel = toDoMedelFromJson(jsonString);

import 'dart:convert';

ToDoMedel toDoMedelFromJson(String str) => ToDoMedel.fromJson(json.decode(str));

String toDoMedelToJson(ToDoMedel data) => json.encode(data.toJson());

class ToDoMedel {
  ToDoMedel({
     this.docId,
     this.title,
     this.description,
     this.semail,
     this.spass
  });

  String?title;
  String?docId;
  String?description;
  String?semail;
  String?spass;

  factory ToDoMedel.fromJson(Map<String, dynamic> json) => ToDoMedel(
    title: json["title"],
    docId: json["docId"],
    description: json["description"],
    semail: json["semail"],
    spass: json["spass"]
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "docId": docId,
    "description": description,
    "semail":semail,
    "spass":spass,
  };
}
class Model {
  Model({
    this.docId,
    // this.title,
    // this.description,
    this.semail,
    this.spass
  });

  // String?title;
  String?docId;
  // String?description;
  String?semail;
  String?spass;

  factory Model.fromJson(Map<String, dynamic> json) => Model(
      // title: json["title"],
      docId: json["docId"],
      // description: json["description"],
      semail: json["semail"],
      spass: json["spass"]
  );

  Map<String, dynamic> toJson() => {
    // "title": title,
    "docId": docId,
    // "description": description,
    "semail":semail,
    "spass":spass,
  };
}
