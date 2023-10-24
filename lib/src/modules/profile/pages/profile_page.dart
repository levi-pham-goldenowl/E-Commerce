import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/profile/logic/profile_bloc.dart';
import 'package:e_commerce/src/modules/profile/widgets/info_profile.dart';
import 'package:e_commerce/src/modules/profile/widgets/list_tile_profile.dart';
import 'package:e_commerce/src/widgets/app_bar/default_app_bar.dart';
import 'package:e_commerce/src/widgets/header/header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final padding = size.width * 0.037;

    return BlocProvider(
      create: (_) => ProfileBloc(),
      child: Scaffold(
        appBar: XDefaultAppBar(actions: [
          IconButton(
            icon: const Icon(Icons.search),
            color: MyColors.colorBlack,
            onPressed: () {},
          ),
        ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: padding),
                child: const XHeader(
                  title: "My Profile",
                ),
              ),
              SizedBox(
                height: size.height * 0.010,
              ),
              BlocBuilder<AccountBloc, AccountState>(builder: (context, state) {
                var email = state.data.email;
                var name = state.data.name;
                var urlImage = state.data.urlAvatar ?? 'N/A';

                return InfoProfile(
                  email: email,
                  imageUrl: urlImage,
                  name: name,
                );
              }),
              const ListTileProfile(),
            ],
          ),
        ),
      ),
    );
  }
}
