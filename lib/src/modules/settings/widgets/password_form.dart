import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/settings/widgets/bottom_sheet.dart';
import 'package:e_commerce/src/widgets/text_field/base_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PasswordForm extends StatelessWidget {
  const PasswordForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "Password",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: MyColors.colorBlack),
              ),
              SizedBox(
                height: size.height * 0.026,
              ),
              TextButton(
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
                          return const XBottomSheetChangePassword();
                        });
                  },
                  child: const Text(
                    "Change",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 14,
                        height: 1.42,
                        color: MyColors.colorGray,
                        fontWeight: FontWeight.w500),
                  ))
            ],
          ),
          XTextField(
              label: "Password",
              value: "1234567890",
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              errorText: "",
              readOnly: true,
              isAction: false,
              onChanged: (value) {}),
        ],
      );
    });
  }
}
