import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/shipping_address_model.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/utils/enum/countries_info.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'shipping_address_state.dart';

class ShippingAddressBloc extends Cubit<ShippingAddressState> {
  ShippingAddressBloc() : super(const ShippingAddressState());

  Domain domain = Domain();

  void changeName(String name) =>
      emit(state.copyWith(name: name, pureName: true));
  void changeAddress(String address) =>
      emit(state.copyWith(address: address, pureAddress: true));
  void changeCity(String city) =>
      emit(state.copyWith(city: city, pureCity: true));

  void changeProvince(String province) =>
      emit(state.copyWith(province: province, pureProvince: true));

  void changeZipCode(String zipCode) =>
      emit(state.copyWith(zipCode: zipCode, pureZipCode: true));
  void changeCountry(CountriesInfo countriesInfo) =>
      emit(state.copyWith(country: countriesInfo, pureCountry: true));

  Future<void> addAddress(BuildContext context) async {
    XSnackBar.showLoading();

    if (state.isValidSaveAddress) {
      var id = XUtils.getRandomString(10);
      final data = XShippingAddress(
          name: state.name,
          address: state.address,
          city: state.city,
          id: id,
          setDefault: false,
          country: state.nameCountry,
          province: state.province,
          zipCode: int.parse(state.zipCode));

      var value = await domain.address.addShippingAddress(data);

      if (value.isSuccess) {
        final List<XShippingAddress> items = [...(state.items ?? []), data];

        emit(state.copyWith(items: items));

        context.read<AccountBloc>().setDataLogin(context, user: value.data);
        XCoordinator.pop(context);
        XSnackBar.show(msg: "Create success");
      } else {
        XSnackBar.show(msg: "Create failure");
      }
    }
    XSnackBar.hideLoading();
  }

  Future<void> updateAddress(BuildContext context,
      {required String id, required bool setDefalut}) async {
    XSnackBar.showLoading();

    if (state.isValidSaveAddress) {
      final data = XShippingAddress(
          name: state.name,
          address: state.address,
          city: state.city,
          id: id,
          setDefault: setDefalut,
          country: state.nameCountry,
          province: state.province,
          zipCode: int.parse(state.zipCode));

      var value = await domain.address.updateShippingAddress(data);

      if (value.isSuccess) {
        final List<XShippingAddress> items = [...(state.items ?? [])];

        emit(state.copyWith(items: items));

        context.read<AccountBloc>().setDataLogin(context, user: value.data);
        XCoordinator.pop(context);
        XSnackBar.show(msg: "Update success");
      } else {
        XSnackBar.show(msg: "Update failure");
      }
    }
    XSnackBar.hideLoading();
  }

  void getDetailShippingAddress({required XShippingAddress data}) =>
      emit((ShippingAddressState(
          address: data.address,
          name: data.name,
          city: data.city,
          province: data.province,
          zipCode: data.zipCode.toString(),
          country: state.country.toCountriesInfo(data.country))));
  void initialState() => emit((const ShippingAddressState()));
  Future<void> removeAddress(BuildContext context,
      {required XShippingAddress data}) async {
    XSnackBar.showLoading();

    var value = await domain.address.removeShippingAddress(data);

    if (value.isSuccess) {
      final List<XShippingAddress> items = [...(state.items ?? [])];
      items.remove(data);

      emit(state.copyWith(items: items));

      context.read<AccountBloc>().setDataLogin(context, user: value.data);

      XSnackBar.show(msg: "Remove success");
    } else {
      XSnackBar.show(msg: "Remove failure");
    }
    XSnackBar.hideLoading();
  }

  Future<void> changeDefaultAddress(BuildContext context,
      {required String id, required XShippingAddress data}) async {
    final xShippingAddress = XShippingAddress(
        name: data.name,
        address: data.address,
        city: data.city,
        id: id,
        setDefault: !data.setDefault,
        country: data.country,
        province: data.province,
        zipCode: data.zipCode);

    var value =
        await domain.address.setDefaultShippingAddress(xShippingAddress);

    if (value.isSuccess) {
      final List<XShippingAddress> items = [...(state.items ?? [])];

      emit(state.copyWith(items: items));

      context.read<AccountBloc>().setDataLogin(context, user: value.data);
    }
  }
}
