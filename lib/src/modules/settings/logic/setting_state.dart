part of 'setting_bloc.dart';

class SettingState extends AccountState {
  final String name;
  final bool pureName;
  final String currentPassword;
  final bool pureCurrentPassword;
  final String newPassword;
  final bool pureNewPassword;
  final String repeatNewPassword;
  final bool pureRepeatNewPassword;
  final String birthDay;
  final bool pureBirthDay;
  String get isValidCurrentPassword {
    return pureCurrentPassword ? XUtils.isValidPassword(currentPassword) : "";
  }

  String get isValidNewPassword {
    return pureNewPassword ? XUtils.isValidPassword(newPassword) : "";
  }

  String get isValidRepeatNewPassword {
    return pureRepeatNewPassword
        ? XUtils.isValidPassword(repeatNewPassword)
        : "";
  }

  String get isValidName {
    return pureName ? XUtils.isValidName(name) : "";
  }

  String get isValidBirthDay {
    return pureBirthDay ? XUtils.isValidBirthDay(birthDay) : "";
  }

  bool get isValidChangeInfo {
    return (XUtils.isValidBirthDay(birthDay) == "" &&
            XUtils.isValidName(name) == "")
        ? true
        : false;
  }

  bool get isValidChangePassword {
    return (XUtils.isValidPassword(currentPassword) == "" &&
            XUtils.isValidPassword(repeatNewPassword) == "" &&
            XUtils.isValidPassword(newPassword) == "" &&
            repeatNewPassword == newPassword)
        ? true
        : false;
  }

  bool get isValidResetPassword {
    return (XUtils.isValidPassword(repeatNewPassword) == "" &&
            XUtils.isValidPassword(newPassword) == "" &&
            repeatNewPassword == newPassword)
        ? true
        : false;
  }

  SettingState({
    this.name = "",
    this.pureName = false,
    this.birthDay = "",
    this.pureBirthDay = false,
    this.newPassword = '',
    this.currentPassword = "",
    this.repeatNewPassword = '',
    this.pureCurrentPassword = false,
    this.pureNewPassword = false,
    this.pureRepeatNewPassword = false,
    XUser? data,
    bool isLoading = false,
  }) : super(data: data ?? XUser.empty(), isLoading: isLoading);

  @override
  List<Object?> get props => [
        name,
        pureName,
        birthDay,
        pureBirthDay,
        data,
        isLoading,
        newPassword,
        pureNewPassword,
        currentPassword,
        pureCurrentPassword,
        repeatNewPassword,
        pureRepeatNewPassword
      ];

  @override
  SettingState copyWith({
    String? name,
    bool? pureName,
    String? birthDay,
    bool? pureBirthDay,
    XUser? data,
    bool? isLoading,
    String? newPassword,
    String? currentPassword,
    String? repeatNewPassword,
    bool? pureRepeatNewPassword,
    bool? pureCurrentPassword,
    bool? pureNewPassword,
  }) {
    return SettingState(
        name: name ?? this.name,
        pureName: pureName ?? this.pureName,
        birthDay: birthDay ?? this.birthDay,
        pureBirthDay: pureBirthDay ?? this.pureBirthDay,
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading,
        currentPassword: currentPassword ?? this.currentPassword,
        newPassword: newPassword ?? this.newPassword,
        pureCurrentPassword: pureCurrentPassword ?? this.pureCurrentPassword,
        pureNewPassword: pureNewPassword ?? this.pureNewPassword,
        pureRepeatNewPassword:
            pureRepeatNewPassword ?? this.pureRepeatNewPassword,
        repeatNewPassword: repeatNewPassword ?? this.repeatNewPassword);
  }
}
