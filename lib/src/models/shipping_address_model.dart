import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XShippingAddress extends BaseModel {
  String name;
  String address;
  String city;
  String province;
  int zipCode;
  String country;
  bool setDefault;

  XShippingAddress({
    this.name = '',
    this.address = '',
    String id = "",
    this.city = '',
    this.province = '',
    this.zipCode = 0,
    this.country = '',
    this.setDefault = false,
  }) : super(id: id);

  factory XShippingAddress.fromJson(Map<String, dynamic> json) {
    return XShippingAddress(
        name: json['name'],
        address: json['address'],
        id: json['id'],
        city: json['city'],
        province: json['province'],
        zipCode: json['zipCode'],
        country: json['country'],
        setDefault: json['setDefault']);
  }

  factory XShippingAddress.empty() {
    return XShippingAddress();
  }

  factory XShippingAddress.formDocument(DocumentSnapshot doc) {
    return XShippingAddress.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['address'] = address;
    data['id'] = id;
    data['city'] = city;
    data['province'] = province;
    data['zipCode'] = zipCode;
    data['country'] = country;
    data['setDefault'] = setDefault;

    return data;
  }
}
