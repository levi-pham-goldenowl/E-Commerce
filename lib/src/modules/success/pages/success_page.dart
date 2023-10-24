import 'dart:math';

import 'package:e_commerce/src/modules/success/widgets/success_option_1.dart';
import 'package:e_commerce/src/modules/success/widgets/success_option_2.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rng = Random();
    final int option = rng.nextInt(2);
    return option == 1 ? const SuccessOption1() : const SuccessOption2();
  }
}
