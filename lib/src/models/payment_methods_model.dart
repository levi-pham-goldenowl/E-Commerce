import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/firestore_model.dart';

class XPaymentMethod extends BaseModel {
  String name;
  int cardNumber;
  String expireDate;
  int cvv;
  bool setDefault;
  int type;

  XPaymentMethod(
      {this.name = '',
      this.cardNumber = 0,
      this.expireDate = '',
      this.cvv = 0,
      this.type = 0,
      this.setDefault = false,
      String id = ''})
      : super(id: id);

  factory XPaymentMethod.fromJson(Map<String, dynamic> json) {
    return XPaymentMethod(
        name: json['name'],
        cardNumber: json['cardNumber'],
        id: json['id'],
        expireDate: json['expireDate'],
        cvv: json['cvv'],
        type: json['type'],
        setDefault: json['setDefault']);
  }

  factory XPaymentMethod.empty() {
    return XPaymentMethod();
  }

  factory XPaymentMethod.formDocument(DocumentSnapshot doc) {
    return XPaymentMethod.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['expireDate'] = expireDate;
    data['id'] = id;
    data['cardNumber'] = cardNumber;
    data['cvv'] = cvv;
    data['type'] = type;
    data['setDefault'] = setDefault;

    return data;
  }
}
