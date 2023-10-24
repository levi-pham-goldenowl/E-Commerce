import 'package:e_commerce/src/constants/my_images.dart';

enum PaymentType { mastercard, visa }

extension PaymentTypeExt on PaymentType {
  String logoOf() {
    switch (this) {
      case PaymentType.mastercard:
        return MyImages.masterCardPayment;
      case PaymentType.visa:
        return MyImages.visaCardPayment;

      default:
        return "N/A";
    }
  }

  bool switchType(PaymentType value) {
    return value == this ? true : false;
  }
}
