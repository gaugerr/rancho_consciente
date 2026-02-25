import 'package:flutter/material.dart';

class MyListViewBuilder extends StatelessWidget {
  final int itemCount;

  final Widget Function(BuildContext context, int index) itemBuilder;

  const MyListViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(18),

      itemCount: itemCount,

      itemBuilder: itemBuilder,
    );
  }
}
