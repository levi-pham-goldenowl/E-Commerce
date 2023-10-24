import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final Function(String) onChanged;

  final String value;

  final bool isAction;

  const SearchTextField({
    Key? key,
    required this.value,
    required this.onChanged,
    this.isAction = true,
  }) : super(key: key);

  @override
  State<SearchTextField> createState() => _XTextFieldState();
}

class _XTextFieldState extends State<SearchTextField> {
  late TextEditingController _controller;
  String get value => widget.value;
  bool obscureText = false;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SearchTextField oldWidget) {
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
          Icons.clear,
          color: MyColors.colorGray,
        ),
        onPressed: () {
          widget.onChanged.call("");
        },
      ));
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
    return TextField(
      style: XStyle.textTheme().titleSmall,
      controller: _controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search, color: MyColors.colorGray),
        suffixIcon: _buildAction(),
        border: InputBorder.none,
        hintText: 'Search...',
        labelStyle: XStyle.textTheme().labelLarge,
        hintStyle: const TextStyle(
            color: MyColors.colorGray, height: 1.42, fontSize: 15),
        fillColor: MyColors.colorWhite,
      ),
      maxLines: 1,
      minLines: 1,
    );
  }
}
