import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/model/listas_compras.dart';

class ListasComprasViewmodel extends ChangeNotifier {
  List<ListasCompras> listasCompras = [
    ListasCompras(
      nomeMercado: 'Mercado Marel',
      data: '02/02/2026',
      descricao: 'Compras de semana',
    ),
    ListasCompras(
      nomeMercado: 'Mercado Dália',
      data: '12/02/2026',
      descricao: 'Rancho do mês',
    ),
    ListasCompras(
      nomeMercado: 'Mercado STR',
      data: '20/02/2026',
      descricao: 'Compras extras do mês',
    ),
  ];
}
