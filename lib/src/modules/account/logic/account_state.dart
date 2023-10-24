part of 'account_bloc.dart';

class AccountState extends Equatable {
  final XUser data;
  final bool isLoading;

  XShippingAddress get shippingAddressDefault =>
      (data.shippingAddresses ?? []).singleWhere((e) => e.setDefault == true,
          orElse: () => XShippingAddress(id: 'N/A'));

  XPaymentMethod get paymentMethodDefault =>
      (data.paymentMethods ?? []).singleWhere((e) => e.setDefault == true,
          orElse: () => XPaymentMethod(id: 'N/A'));
  bool get canShippingAndPayment =>
      paymentMethodDefault.id != 'N/A' && shippingAddressDefault.id != 'N/A';

  const AccountState({this.isLoading = true, required this.data});

  @override
  List<Object?> get props => [isLoading, data];
  AccountState copyWith({
    bool? isLoading,
    XUser? data,
  }) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading,
      data: data ?? this.data,
    );
  }
}
