import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/settings/logic/setting_bloc.dart';
import 'package:e_commerce/src/modules/settings/widgets/notifications_setting.dart';
import 'package:e_commerce/src/modules/settings/widgets/password_form.dart';
import 'package:e_commerce/src/modules/settings/widgets/personal_info_form.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;
    final sizeBox = SizedBox(
      height: size.height * 0.02,
    );
    return BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
      return BlocProvider(
          create: ((_) => SettingBloc(SettingState(
              name: state.data.name, birthDay: state.data.birthDay ?? ""))),
          child:
              BlocBuilder<SettingBloc, SettingState>(builder: (context, state) {
            return Scaffold(
                appBar: XDefaultAppBar(actions: [
                  IconButton(
                      onPressed: () =>
                          context.read<SettingBloc>().saveInformation(context),
                      icon: const Icon(
                        Icons.save,
                        color: MyColors.colorBlack,
                      )),
                  IconButton(
                    icon: const Icon(Icons.search),
                    color: MyColors.colorBlack,
                    onPressed: () {},
                  )
                ]),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(padding, 0, padding, 0),
                    child: Column(
                      children: [
                        const XHeader(title: "Settings"),
                        sizeBox,
                        const PersonalInfoForm(),
                        sizeBox,
                        const PasswordForm(),
                        sizeBox,
                        const NotificationsSetting(),
                      ],
                    ),
                  ),
                ));
          }));
    });
  }
}
