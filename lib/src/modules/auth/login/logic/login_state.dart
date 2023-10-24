part of 'login_bloc.dart';

class LoginState extends SignState {
  bool get isValidLogin {
    return (XUtils.isValidEmail(email) == "" &&
            XUtils.isValidPassword(password) == "")
        ? true
        : false;
  }

  Function()? onPressedLogin(BuildContext context) {
    return isValidLogin
        ? () => context.read<LoginBloc>().loginWithEmailAndPassword(
              context,
            )
        : null;
  }

  const LoginState({
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
            purePassword: purePassword);

  @override
  List<Object?> get props => [
        messageError,
        email,
        password,
        pureEmail,
        purePassword,
      ];

  @override
  LoginState copyWith({
    String? email,
    String? password,
    bool? pureEmail,
    bool? purePassword,
    String? messageError,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      pureEmail: pureEmail ?? this.pureEmail,
      purePassword: purePassword ?? this.purePassword,
      messageError: messageError ?? this.messageError,
    );
  }
}
