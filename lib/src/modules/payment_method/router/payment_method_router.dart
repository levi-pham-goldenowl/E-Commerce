import 'package:auto_route/auto_route.dart';
import 'package:e_commerce/src/modules/payment_method/logic/payment_method_bloc.dart';
import 'package:e_commerce/src/modules/payment_method/pages/payment_method_page.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/bottom_sheet_new_payment.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentMethodRouters {
  static const String paymentMethod = 'payment_method';
}

class PaymentMethodCoordinator {
  static const autoRoute = AutoRoute(
      path: PaymentMethodRouters.paymentMethod,
      page: PaymentMethodPage,
      name: "PaymentMethodRoute");

  static showBottomSheetNewPayment(BuildContext context) {
    context.read<PaymentMethodBloc>().initialState();
    XBottomSheet.show(context, widget: const XBottomSheetNewPayment());
  }
}
