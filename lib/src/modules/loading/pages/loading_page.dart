import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/modules/account/logic/account_bloc.dart';
import 'package:e_commerce/src/modules/auth/login/router/sign_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: (context, state) {
        if (state.isLoading == false) {
          if (state.data.id == "") {
            SignCoordinator.showSignUp(context);
          } else {
            XCoordinator.showDashboard();
          }
        }
      },
      child: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Loading....'),
            CircularProgressIndicator(),
          ],
        )),
      ),
    );
  }
}
