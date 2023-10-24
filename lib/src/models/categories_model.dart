import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XCategories extends BaseModel {
  String name;

  XCategories({
    String id = '',
    this.name = '',
  }) : super(id: id);

  factory XCategories.fromJson(Map<String, dynamic> json) {
    return XCategories(name: json['name'], id: json['id']);
  }
  factory XCategories.empty() {
    return XCategories();
  }
  factory XCategories.formDocument(DocumentSnapshot doc) {
    return XCategories.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
