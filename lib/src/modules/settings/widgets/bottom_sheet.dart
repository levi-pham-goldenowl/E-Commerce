import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/settings/logic/setting_bloc.dart';
import 'package:e_commerce/src/modules/settings/widgets/bottom_sheet_reset.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XBottomSheetChangePassword extends StatelessWidget {
  const XBottomSheetChangePassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    const sizedbox = SizedBox(
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
                    'Password Change',
                    style: XStyle.textTheme().headlineSmall,
                  ),
                  sizedbox,
                  XTextField(
                      label: "Old Password",
                      value: state.currentPassword,
                      textInputType: TextInputType.visiblePassword,
                      obscureText: true,
                      errorText: state.isValidCurrentPassword,
                      onChanged: (value) => context
                          .read<SettingBloc>()
                          .changedCurrentPassword(value)),
                  Align(
                    alignment: Alignment.topRight,
                    child: SizedBox(
                      height: 25,
                      child: TextButton(
                          onPressed: () {
                            const radius = Radius.circular(34);
                            showModalBottomSheet<void>(
                                isScrollControlled: true,
                                context: context,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: radius, topRight: radius)),
                                backgroundColor: MyColors.colorBackground,
                                builder: (BuildContext context) {
                                  return const XBottomSheetResetPassword();
                                });
                          },
                          child: const Text("Forgot Password",
                              style: TextStyle(
                                  color: MyColors.colorGray,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 0.5))),
                    ),
                  ),
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
                  sizedbox,
                  XButton(
                    label: 'SAVE PASSWORD',
                    width: size.width,
                    height: size.height * 0.059,
                    onPressed: () =>
                        context.read<SettingBloc>().saveChangePassword(context),
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
