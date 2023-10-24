part of 'payment_method_bloc.dart';

class PaymentMethodState extends Equatable {
  final String name;
  final bool pureName;
  final String cardNumber;
  final bool pureCardNumber;
  final String expireDate;
  final bool pureExpireDate;
  final String cvv;
  final bool pureCVV;
  final PaymentType paymentType;
  final bool setDefault;

  final List<XPaymentMethod>? items;

  String get isValidName {
    return pureName ? XUtils.isValidNamePaymentMethod(name) : "";
  }

  String get isValidCardNumber {
    return pureCardNumber ? XUtils.isValidCardNumber(cardNumber) : "";
  }

  String get isValidCVV {
    return pureCVV ? XUtils.isValidCVV(cvv) : "";
  }

  bool get isValidAddCard {
    return (XUtils.isValidNamePaymentMethod(name) == "" &&
            XUtils.isValidCardNumber(cardNumber) == "" &&
            XUtils.isValidCVV(cvv) == "")
        ? true
        : false;
  }

  const PaymentMethodState({
    this.name = '',
    this.cardNumber = '',
    this.expireDate = '',
    this.cvv = '',
    this.pureCVV = false,
    this.pureCardNumber = false,
    this.pureExpireDate = false,
    this.pureName = false,
    this.items,
    this.paymentType = PaymentType.mastercard,
    this.setDefault = false,
  });
  @override
  List<Object?> get props => [
        name,
        cardNumber,
        expireDate,
        cvv,
        pureName,
        pureCardNumber,
        pureExpireDate,
        pureCVV,
        items,
        paymentType,
        setDefault,
      ];

  PaymentMethodState copyWith({
    String? name,
    String? cardNumber,
    String? expireDate,
    String? cvv,
    bool? pureName,
    bool? pureCardNumber,
    bool? pureExpireDate,
    bool? pureCVV,
    PaymentType? paymentType,
    bool? setDefault,
    List<XPaymentMethod>? items,
  }) {
    return PaymentMethodState(
        name: name ?? this.name,
        cardNumber: cardNumber ?? this.cardNumber,
        cvv: cvv ?? this.cvv,
        expireDate: expireDate ?? this.expireDate,
        pureCVV: pureCVV ?? this.pureCVV,
        pureCardNumber: pureCardNumber ?? this.pureCardNumber,
        pureExpireDate: pureExpireDate ?? this.pureExpireDate,
        pureName: pureName ?? this.pureName,
        items: items ?? this.items,
        paymentType: paymentType ?? this.paymentType,
        setDefault: setDefault ?? this.setDefault);
  }
}
