part of 'sign_bloc.dart';

class SignState extends Equatable {
  final String messageError;
  final String email;
  final String password;
  final bool pureEmail;
  final bool purePassword;

  String get isValidEmail {
    return pureEmail ? XUtils.isValidEmail(email) : "";
  }

  String get isValidPassword {
    return purePassword ? XUtils.isValidPassword(password) : "";
  }

  const SignState({
    this.messageError = '',
    this.email = "",
    this.password = "",
    this.pureEmail = false,
    this.purePassword = false,
  });

  @override
  List<Object?> get props => [
        messageError,
        email,
        password,
        pureEmail,
        purePassword,
      ];

  SignState copyWith({
    String? email,
    String? password,
    bool? pureEmail,
    bool? purePassword,
    String? messageError,
  }) {
    return SignState(
      email: email ?? this.email,
      password: password ?? this.password,
      pureEmail: pureEmail ?? this.pureEmail,
      purePassword: purePassword ?? this.purePassword,
      messageError: messageError ?? this.messageError,
    );
  }
}
