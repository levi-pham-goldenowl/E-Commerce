import 'package:e_commerce/src/modules/auth/login/logic/login_bloc.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/bottom_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/header_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/message_error_sign.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_button/text_button_custom.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final paddingHori = size.width / 20;
    final paddingTop = MediaQuery.of(context).padding.top;
    final height = size.height -
        MediaQuery.of(context).padding.bottom -
        MediaQuery.of(context).padding.top;

    return BlocProvider(
      create: (context) => LoginBloc(),
      child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
        return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: const AppBarSign(),
            body: SingleChildScrollView(
              child: SizedBox(
                height: height,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      paddingHori, paddingTop, paddingHori, 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const HeaderSign(title: "Login"),
                      Column(
                        children: [
                          XTextField(
                            label: "Email",
                            value: state.email,
                            textInputType: TextInputType.emailAddress,
                            errorText: state.isValidEmail,
                            onChanged: (value) =>
                                context.read<LoginBloc>().changedEmail(value),
                          ),
                          XTextField(
                            label: "Password",
                            value: state.password,
                            obscureText: true,
                            errorText: state.isValidPassword,
                            onChanged: (value) => context
                                .read<LoginBloc>()
                                .changedPassword(value),
                          ),
                          _forgotYourPassword(),
                          XButton(
                            width: size.width,
                            label: "LOGIN",
                            onPressed: state.onPressedLogin(context),
                            height: 48,
                          ),
                          MessageErrorSign(
                            isError: state.messageError.isNotEmpty,
                            message: state.messageError,
                          )
                        ],
                      ),
                      const Spacer(),
                      BottomSign(
                          title: "Or login with social account",
                          onClickGoogle: () =>
                              context.read<LoginBloc>().withGoogle(context)),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }

  Widget _forgotYourPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: XTextButtonCus(
        title: "Forgot your password?",
        onPressed: () {},
      ),
    );
  }
}
