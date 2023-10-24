import 'package:e_commerce/src/models/payment_methods_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/users_model.dart';

abstract class PaymentMethodRepository {
  Future<XResult<XUser>> updatePaymentMethod(XPaymentMethod data);

  Future<XResult<XUser>> addPaymentMethod(XPaymentMethod data);
  Future<XResult> removePaymentMethod(XPaymentMethod data);
}
