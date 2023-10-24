import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XMessage extends BaseModel {
  final String title;
  final String body;
  final String dateTime;
  final String? image;

  XMessage({
    this.title = '',
    String id = '',
    this.dateTime = '',
    this.image,
    this.body = '',
  }) : super(id: id);

  factory XMessage.fromJson(Map<String, dynamic> json, {String? id}) {
    return XMessage(
      title: json['title'],
      body: json['body'],
      id: json['id'],
      dateTime: json['dateTime'],
      image: json['image'],
    );
  }

  factory XMessage.empty() {
    return XMessage();
  }
  factory XMessage.formDocument(DocumentSnapshot doc) {
    return XMessage.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['body'] = body;
    data['id'] = id;
    data['image'] = image;
    data['dateTime'] = dateTime;

    return data;
  }
}
