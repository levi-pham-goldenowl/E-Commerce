import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:e_commerce/src/modules/auth/sign_up/logic/sign_up_bloc.dart';
import 'package:e_commerce/src/modules/auth/widgets/app_bar_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/bottom_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/header_sign.dart';
import 'package:e_commerce/src/modules/auth/widgets/message_error_sign.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_button/text_button_custom.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const paddingHori = 16.0;
    final paddingAppbar = MediaQuery.of(context).padding.top;

    return BlocProvider(
        create: (context) => SignUpBloc(),
        child: BlocBuilder<SignUpBloc, SignUpState>(
          builder: (context, state) {
            return Scaffold(
                extendBodyBehindAppBar: true,
                appBar: const AppBarSign(),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        paddingHori, paddingAppbar, paddingHori, 15),
                    child: Column(
                      children: [
                        const HeaderSign(
                          title: "Sign up",
                        ),
                        XTextField(
                          label: "Name",
                          value: state.name,
                          textInputType: TextInputType.name,
                          errorText: state.isValidName,
                          onChanged: (value) =>
                              context.read<SignUpBloc>().changedName(value),
                        ),
                        XTextField(
                          label: "Email",
                          value: state.email,
                          textInputType: TextInputType.emailAddress,
                          errorText: state.isValidEmail,
                          onChanged: (value) =>
                              context.read<SignUpBloc>().changedEmail(value),
                        ),
                        XTextField(
                          value: state.password,
                          label: "Password",
                          obscureText: true,
                          errorText: state.isValidPassword,
                          onChanged: (value) =>
                              context.read<SignUpBloc>().changedPassword(value),
                        ),
                        _haveAnAccount(context),
                        XButton(
                          width: size.width,
                          label: "SIGN UP",
                          onPressed: state.onPressedSignUp(context),
                          height: 48,
                        ),
                        MessageErrorSign(
                            isError: state.messageError.isNotEmpty,
                            message: state.messageError),
                        BottomSign(
                          title: "Or sign up with social account",
                          onClickGoogle: () =>
                              context.read<SignUpBloc>().withGoogle(context),
                        ),
                      ],
                    ),
                  ),
                ));
          },
        ));
  }

  Widget _haveAnAccount(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: XTextButtonCus(
        title: "Already have an account?",
        onPressed: () {
          SignCoordinator.showLogin(context);
        },
      ),
    );
  }
}
