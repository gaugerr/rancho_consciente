import 'package:flutter/material.dart';

class ShowBottomSheet {
  static void bottomSheet(BuildContext context, Widget formsScreen) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return formsScreen;
      },
    );
  }
}
