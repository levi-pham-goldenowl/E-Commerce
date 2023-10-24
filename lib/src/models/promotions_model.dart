import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XPromotion extends BaseModel {
  String name;
  double discount;
  String image;
  String code;
  int timeRemaining;

  XPromotion({
    this.name = '',
    String id = '',
    this.image = '',
    this.discount = 0,
    this.code = '',
    this.timeRemaining = 0,
  }) : super(id: id);

  factory XPromotion.fromJson(Map<String, dynamic> json) {
    return XPromotion(
      name: json['name'],
      image: json['image'],
      code: json['code'],
      timeRemaining: json['timeRemaining'],
      discount: json['discount'].toDouble(),
      id: json['id'],
    );
  }

  factory XPromotion.empty() {
    return XPromotion();
  }

  factory XPromotion.formDocument(DocumentSnapshot doc) {
    return XPromotion.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['timeRemaining'] = timeRemaining;
    data['code'] = code;
    data['discount'] = discount;

    return data;
  }
}
