import 'package:flutter/material.dart';

class EmptyDisplay extends StatelessWidget {
  const EmptyDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SizedBox(
        height: 100,
        child: Center(
          child: Text(
            'Empty List',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
