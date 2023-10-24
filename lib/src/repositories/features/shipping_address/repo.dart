import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';

import 'package:e_commerce/src/models/users_model.dart';

abstract class ShippingAddressRepository {
  Future<XResult<XUser>> updateShippingAddress(XShippingAddress data);
  Future<XResult<XUser>> setDefaultShippingAddress(XShippingAddress data);

  Future<XResult<XUser>> addShippingAddress(XShippingAddress data);
  Future<XResult> removeShippingAddress(XShippingAddress data);
}
