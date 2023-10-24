import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class SuccessOption2 extends StatelessWidget {
  const SuccessOption2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    MyImages.bannerSuccess2,
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Success!',
                    style: TextStyle(
                        color: MyColors.colorBlack,
                        height: 1,
                        fontSize: 34,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'Your order will be delivered soon.\n',
                      style: TextStyle(
                          fontSize: 14,
                          height: 1.5,
                          fontWeight: FontWeight.normal,
                          color: MyColors.colorBlack),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Thank you for choosing our app!',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(18, 5, 14, 45),
                  child: XButton(
                    label: 'CONTINUE SHOPPING',
                    height: 48,
                    width: double.infinity,
                    onPressed: () => DashboardCoordinator.showYourCart(context),
                  )),
            ),
          ],
        ),
      ),
    ));
  }
}
