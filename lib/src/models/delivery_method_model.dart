import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XDeliveryMethod extends BaseModel {
  String name;
  int shippingFromDate;
  int shippingToDate;
  double price;
  String image;

  XDeliveryMethod(
      {this.name = '',
      this.shippingFromDate = 0,
      this.price = 0.0,
      this.shippingToDate = 0,
      this.image = '',
      String id = ''})
      : super(id: id);

  factory XDeliveryMethod.fromJson(Map<String, dynamic> json) {
    return XDeliveryMethod(
      name: json['name'],
      shippingFromDate: json['shippingFromDate'],
      shippingToDate: json['shippingToDate'],
      id: json['id'],
      price: json['price'].toDouble(),
      image: json['image'],
    );
  }

  factory XDeliveryMethod.empty() {
    return XDeliveryMethod();
  }
  factory XDeliveryMethod.formDocument(DocumentSnapshot doc) {
    return XDeliveryMethod.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['shippingToDate'] = shippingToDate;
    data['shippingFromDate'] = shippingFromDate;
    data['id'] = id;
    data['price'] = price;
    data['image'] = image;

    return data;
  }
}
