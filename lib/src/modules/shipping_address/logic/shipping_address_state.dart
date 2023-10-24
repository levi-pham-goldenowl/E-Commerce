part of 'shipping_address_bloc.dart';

class ShippingAddressState extends Equatable {
  final String name;
  final bool pureName;
  final String address;
  final bool pureAddress;
  final String city;
  final bool pureCity;
  final String province;
  final bool pureProvince;
  final String zipCode;
  final bool pureZipCode;
  final CountriesInfo country;
  final bool pureCountry;
  final List<XShippingAddress>? items;

  String get nameCountry => country.value();

  String get isValidName {
    return pureName ? XUtils.isValidNameShippingAddress(name) : "";
  }

  String get isValidAddress {
    return pureAddress ? XUtils.isValidAddress(address) : "";
  }

  String get isValidCity {
    return pureCity ? XUtils.isValidCity(city) : "";
  }

  String get isValidProvince {
    return pureProvince ? XUtils.isValidProvince(province) : "";
  }

  String get isValidZipCode {
    return pureZipCode ? XUtils.isValidZipCode(zipCode) : "";
  }

  String get isValidCountry {
    return pureCountry ? XUtils.isValidCountry(nameCountry) : "";
  }

  bool get isValidSaveAddress {
    return (XUtils.isValidNameShippingAddress(name) == "" &&
            XUtils.isValidAddress(address) == "" &&
            XUtils.isValidCity(city) == "" &&
            XUtils.isValidProvince(province) == "" &&
            XUtils.isValidZipCode(zipCode.toString()) == "" &&
            XUtils.isValidCountry(nameCountry) == "")
        ? true
        : false;
  }

  const ShippingAddressState({
    this.name = '',
    this.address = '',
    this.city = '',
    this.country = CountriesInfo.unitedStates,
    this.province = '',
    this.zipCode = '',
    this.pureAddress = false,
    this.pureCity = false,
    this.pureCountry = false,
    this.pureName = false,
    this.pureProvince = false,
    this.pureZipCode = false,
    this.items,
  });
  @override
  List<Object?> get props => [
        name,
        address,
        city,
        province,
        zipCode,
        country,
        pureAddress,
        pureCity,
        pureCountry,
        pureName,
        pureProvince,
        pureZipCode,
        items,
      ];

  ShippingAddressState copyWith({
    String? name,
    String? address,
    String? city,
    String? province,
    String? zipCode,
    CountriesInfo? country,
    bool? pureName,
    bool? pureAddress,
    bool? pureCity,
    bool? pureProvince,
    bool? pureZipCode,
    bool? pureCountry,
    List<XShippingAddress>? items,
  }) {
    return ShippingAddressState(
      name: name ?? this.name,
      address: address ?? this.address,
      city: city ?? this.city,
      province: province ?? this.province,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      pureAddress: pureAddress ?? this.pureAddress,
      pureCity: pureCity ?? this.pureCity,
      pureCountry: pureCountry ?? this.pureCountry,
      pureName: pureName ?? this.pureName,
      pureProvince: pureProvince ?? this.pureProvince,
      pureZipCode: pureZipCode ?? this.pureZipCode,
      items: items ?? this.items,
    );
  }
}
