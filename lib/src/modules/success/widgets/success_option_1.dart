import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/constants/my_images.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';

class SuccessOption1 extends StatelessWidget {
  const SuccessOption1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(MyImages.bannerSuccess))),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 100),
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
                      fontSize: 16,
                      height: 1.5,
                      fontWeight: FontWeight.w600,
                      color: MyColors.colorBlack),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Thank you for choosing our app!',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              XButton(
                label: 'Continue shopping',
                height: 36,
                onPressed: () => DashboardCoordinator.showYourCart(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
