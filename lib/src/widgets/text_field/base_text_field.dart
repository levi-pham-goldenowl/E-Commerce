import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:flutter/material.dart';

class XTextField extends StatefulWidget {
  final String label;
  final TextInputType textInputType;
  final bool obscureText;
  final Function(String) onChanged;
  final String errorText;
  final String value;
  final bool readOnly;
  final bool isAction;
  final Function()? onTap;
  const XTextField(
      {Key? key,
      required this.value,
      required this.label,
      required this.onChanged,
      required this.errorText,
      this.onTap,
      this.isAction = true,
      this.readOnly = false,
      this.obscureText = false,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  State<XTextField> createState() => _XTextFieldState();
}

class _XTextFieldState extends State<XTextField> {
  late TextEditingController _controller;
  String get value => widget.value;
  bool obscureText = false;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant XTextField oldWidget) {
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
    if (widget.obscureText && widget.isAction) {
      actions.add(
        IconButton(
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: MyColors.colorGray,
          ),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
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
          style: XStyle.textTheme().titleSmall,
          readOnly: widget.readOnly,
          controller: _controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              labelText: widget.label,
              suffixIcon: _buildAction(),
              errorText: widget.errorText,
              errorStyle: const TextStyle(
                fontWeight: FontWeight.w500,
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
          obscureText: obscureText,
        ),
      ),
    );
  }
}
