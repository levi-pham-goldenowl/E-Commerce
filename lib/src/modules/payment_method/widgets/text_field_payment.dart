import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/payment_method/logic/payment_method_bloc.dart';
import 'package:e_commerce/src/utils/enum/payment_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XTextFieldPayment extends StatefulWidget {
  final String label;
  final TextInputType textInputType;
  final bool isShowHelp;
  final bool isShowTypeCard;
  final Function(String) onChanged;
  final String value;
  final bool readOnly;
  final bool isAction;
  final Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final String errorText;

  const XTextFieldPayment(
      {Key? key,
      required this.value,
      required this.label,
      this.inputFormatters,
      required this.onChanged,
      required this.errorText,
      this.isShowTypeCard = false,
      this.onTap,
      this.isAction = true,
      this.readOnly = false,
      this.isShowHelp = false,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  State<XTextFieldPayment> createState() => _XTextFieldPaymentState();
}

class _XTextFieldPaymentState extends State<XTextFieldPayment> {
  late TextEditingController _controller;
  String get value => widget.value;
  bool isShowHelp = false;
  bool isShowTypeCard = false;
  bool masterCard = true;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    isShowHelp = widget.isShowHelp;
    isShowTypeCard = widget.isShowTypeCard;

    super.initState();
  }

  @override
  void didUpdateWidget(covariant XTextFieldPayment oldWidget) {
    if (_controller.text != widget.value) {
      _controller.text = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget? _buildAction() {
    final List<Widget> actions = [];
    if (value.isNotEmpty && widget.isAction) {
      actions.add(IconButton(
        icon: const Icon(
          Icons.cancel,
          color: MyColors.colorGray,
        ),
        onPressed: () {
          widget.onChanged.call("");
        },
      ));
    }
    if (widget.isShowTypeCard && widget.isAction) {
      actions.add(BlocBuilder<PaymentMethodBloc, PaymentMethodState>(
        builder: (context, state) {
          return IconButton(
            icon: Image.asset(
              masterCard
                  ? PaymentType.mastercard.logoOf()
                  : PaymentType.visa.logoOf(),
              color: masterCard ? null : Colors.blue,
            ),
            onPressed: () {
              setState(() {
                masterCard = !masterCard;
              });
              PaymentType paymentType =
                  masterCard ? PaymentType.mastercard : PaymentType.visa;
              context.read<PaymentMethodBloc>().changeType(paymentType);
            },
          );
        },
      ));
    }
    if (widget.isShowHelp && widget.isAction) {
      actions.add(
        IconButton(
          icon: const Icon(
            Icons.help_outline,
            color: MyColors.colorGray,
          ),
          onPressed: () {},
        ),
      );
    }
    if (actions.isEmpty) {
      return null;
    }
    if (actions.length == 1) {
      return actions[0];
    }
    return Row(
      children: actions,
      mainAxisSize: MainAxisSize.min,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 80,
        decoration: const BoxDecoration(boxShadow: [
          BoxShadow(
              color: MyColors.colorShadowTextFormField,
              offset: Offset(0, 1),
              spreadRadius: -25,
              blurRadius: 8)
        ]),
        child: TextField(
          inputFormatters: widget.inputFormatters,
          style: XStyle.textTheme().titleSmall,
          readOnly: widget.readOnly,
          controller: _controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              labelText: widget.label,
              suffixIcon: _buildAction(),
              errorText: widget.errorText,
              errorStyle: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
              border: InputBorder.none,
              hintText: widget.label,
              labelStyle: XStyle.textTheme().labelLarge,
              hintStyle: XStyle.textTheme().titleSmall,
              fillColor: MyColors.colorWhite,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 22)),
          keyboardType: widget.textInputType,
          maxLines: 1,
          minLines: 1,
          onTap: widget.onTap,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}
