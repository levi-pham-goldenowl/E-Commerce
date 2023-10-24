import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/settings/logic/setting_bloc.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetResetPassword extends StatelessWidget {
  const XBottomSheetResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    const sizeBox = SizedBox(
      height: 5,
    );
    return BlocProvider(
      create: (_) => SettingBloc(SettingState()),
      child: BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
        return SizedBox(
          height: size.height * 0.58,
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Reset Password',
                    style: XStyle.textTheme().headlineSmall,
                  ),
                  sizeBox,
                  XTextField(
                      label: "New Password",
                      value: state.newPassword,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                      errorText: state.isValidNewPassword,
                      onChanged: (value) => context
                          .read<SettingBloc>()
                          .changedNewPassword(value)),
                  XTextField(
                      label: "Repeat New Password",
                      value: state.repeatNewPassword,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                      errorText: state.isValidRepeatNewPassword,
                      onChanged: (value) => context
                          .read<SettingBloc>()
                          .changedRepeatNewPassword(value)),
                  sizeBox,
                  XButton(
                    label: 'RESET PASSWORD',
                    width: size.width,
                    height: size.height * 0.059,
                    onPressed: () =>
                        context.read<SettingBloc>().resetPassword(context),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
