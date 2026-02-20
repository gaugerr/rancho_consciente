import 'package:flutter/material.dart';

class AppUtils {
  static Future<DateTime?> datePicker(BuildContext context) {
    final DateTime agora = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: agora,
      firstDate: DateTime(2026),
      lastDate: DateTime(agora.year + 1, 12, 31),
      helpText: 'Selecione a data do rancho',
      cancelText: 'Sair',
      confirmText: 'Selecionar',
    );
  }
}
