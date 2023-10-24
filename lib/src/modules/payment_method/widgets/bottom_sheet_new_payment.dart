import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/payment_method/logic/payment_method_bloc.dart';
import 'package:e_commerce/src/modules/payment_method/widgets/text_field_payment.dart';
import 'package:e_commerce/src/widgets/button/button_primary.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class XBottomSheetNewPayment extends StatelessWidget {
  const XBottomSheetNewPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _radius = const Radius.circular(34);
    return BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
        builder: (context, state) {
      return SingleChildScrollView(
          child: Container(
        decoration: BoxDecoration(
            color: MyColors.colorBackground,
            borderRadius:
                BorderRadius.only(topLeft: _radius, topRight: _radius)),
        height: 500,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Add new card',
                  style: XStyle.textTheme().headlineSmall,
                ),
                const SizedBox(
                  height: 5,
                ),
                XTextFieldPayment(
                    errorText: state.isValidName,
                    onChanged: (value) =>
                        context.read<PaymentMethodBloc>().changeName(value),
                    label: 'Name on card',
                    value: state.name),
                XTextFieldPayment(
                    errorText: state.isValidCardNumber,
                    onChanged: (value) => context
                        .read<PaymentMethodBloc>()
                        .changeNumberCard(value),
                    label: 'Card number',
                    value: state.cardNumber,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                    ],
                    textInputType: TextInputType.number,
                    isShowTypeCard: true),
                XTextFieldPayment(
                    errorText: '',
                    label: "Expire Date",
                    value: state.expireDate,
                    readOnly: true,
                    textInputType: TextInputType.datetime,
                    onTap: () => _selectDate(context),
                    onChanged: (value) {}),
                XTextFieldPayment(
                    errorText: state.isValidCVV,
                    onChanged: (value) =>
                        context.read<PaymentMethodBloc>().changeCVV(value),
                    label: 'CVV',
                    value: state.cvv,
                    textInputType: TextInputType.number,
                    isShowHelp: true),
                Expanded(child: _setDefaultWidget()),
                const SizedBox(
                  height: 20,
                ),
                XButton(
                    label: 'ADD CARD',
                    height: 47,
                    width: double.infinity,
                    onPressed: state.isValidAddCard
                        ? () => context
                            .read<PaymentMethodBloc>()
                            .addPaymentMethod(context)
                        : null),
              ],
            ),
          ),
        ),
      ));
    });
  }

  void _selectDate(BuildContext context) async {
    var formatter = DateFormat('dd/MM');
    DateTime selectedDate = DateTime.now();

    String date = "";
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1800),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      selectedDate = selected;
      date = formatter.format(selectedDate);

      context.read<PaymentMethodBloc>().changeExpireDate(date);
    }
  }
}

Widget _setDefaultWidget() {
  return BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
    builder: (context, state) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: state.setDefault,
            activeColor: MyColors.colorBlack,
            onChanged: (value) => context
                .read<PaymentMethodBloc>()
                .changeDefault(!state.setDefault),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),
          const Text(
            'Set as default payment method',
            style: TextStyle(
                color: MyColors.colorBlack,
                height: 1,
                fontSize: 14,
                fontWeight: FontWeight.normal),
          )
        ],
      );
    },
  );
}
