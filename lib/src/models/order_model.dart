import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/delivery_method_model.dart';
import 'package:e_commerce/src/models/firestore_model.dart';
import 'package:e_commerce/src/models/payment_methods_model.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/promotions_model.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';

class XOrder extends BaseModel {
  String trackingNumber;
  String date;
  String status;
  XShippingAddress shippingAddressData;
  XPaymentMethod paymentMethodData;
  XDeliveryMethod deliveryMethodData;
  XPromotion promotionData;
  double total;
  List<XProduct> listProducts;

  XOrder({
    this.trackingNumber = '',
    this.date = '',
    String id = "",
    this.status = '',
    required this.shippingAddressData,
    required this.paymentMethodData,
    required this.deliveryMethodData,
    required this.promotionData,
    this.total = 0.0,
    required this.listProducts,
  }) : super(id: id);

  factory XOrder.fromJson(Map<String, dynamic> json) {
    return XOrder(
      shippingAddressData:
          XShippingAddress.fromJson(json['shippingAddressData']),
      paymentMethodData: XPaymentMethod.fromJson(json['paymentMethodData']),
      promotionData: XPromotion.fromJson(json['promotionData']),
      listProducts: (json['listProducts'] as List)
          .map((e) => XProduct.fromJson(e))
          .toList(),
      date: json['date'],
      deliveryMethodData: XDeliveryMethod.fromJson(json['deliveryMethodData']),
      id: json['id'],
      status: json['status'],
      total: json['total'].toDouble(),
      trackingNumber: json['trackingNumber'],
    );
  }

  factory XOrder.empty() {
    return XOrder(
        deliveryMethodData: XDeliveryMethod.empty(),
        shippingAddressData: XShippingAddress.empty(),
        paymentMethodData: XPaymentMethod.empty(),
        promotionData: XPromotion.empty(),
        listProducts: []);
  }

  factory XOrder.formDocument(DocumentSnapshot doc) {
    return XOrder.fromJson(doc.data() as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['deliveryMethodData'] = deliveryMethodData.toJson();
    data['id'] = id;
    data['listProducts'] = listProducts.map((e) => e.toJson()).toList();
    data['paymentMethodData'] = paymentMethodData.toJson();
    data['promotionData'] = promotionData.toJson();
    data['shippingAddressData'] = shippingAddressData.toJson();
    data['total'] = total;
    data['trackingNumber'] = trackingNumber;
    data['status'] = status;

    return data;
  }
}
