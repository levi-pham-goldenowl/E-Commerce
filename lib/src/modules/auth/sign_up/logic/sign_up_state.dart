part of 'sign_up_bloc.dart';

class SignUpState extends SignState {
  final String name;
  final bool pureName;

  String get isValidName {
    return pureName ? XUtils.isValidName(name) : "";
  }

  bool get isValidSignUp {
    return (XUtils.isValidEmail(email) == "" &&
            XUtils.isValidPassword(password) == "" &&
            XUtils.isValidName(name) == "")
        ? true
        : false;
  }

  Function()? onPressedSignUp(BuildContext context) {
    return isValidSignUp
        ? () => context.read<SignUpBloc>().createAccount(context)
        : null;
  }

  const SignUpState({
    this.name = "",
    this.pureName = false,
    String email = "",
    String password = "",
    String messageError = "",
    bool pureEmail = false,
    bool purePassword = false,
  }) : super(
          email: email,
          password: password,
          messageError: messageError,
          pureEmail: pureEmail,
          purePassword: purePassword,
        );

  @override
  List<Object?> get props => [
        name,
        pureName,
        messageError,
        email,
        password,
        pureEmail,
        purePassword,
      ];

  @override
  SignUpState copyWith({
    String? name,
    bool? pureName,
    String? email,
    String? password,
    String? messageError,
    bool? pureEmail,
    bool? purePassword,
  }) {
    return SignUpState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      pureName: pureName ?? this.pureName,
      pureEmail: pureEmail ?? this.pureEmail,
      purePassword: purePassword ?? this.purePassword,
      messageError: messageError ?? this.messageError,
    );
  }
}
