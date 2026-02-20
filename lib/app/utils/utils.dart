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

  static DateTime converterData(String dataString) {
    List<String> partes = dataString.split('/'); // Divide em [19, 02, 2026]
    return DateTime(
      int.parse(partes[2]), // Ano
      int.parse(partes[1]), // Mês
      int.parse(partes[0]), // Dia
    );
  }
}
