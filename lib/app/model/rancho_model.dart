import 'categoria_model.dart';

class RanchoModel {
  String mercado;
  DateTime data;
  String descricao;
  List<CategoriaModel> categorias;

  RanchoModel({
    required this.mercado,
    required this.data,
    required this.categorias,
    required this.descricao,
  });

  double get valorTotalCompra {
    return categorias.fold(
      0,
      (total, categoria) => total + categoria.totalCategoria,
    );
  }

  String get progressoGeral {
    int totalItens = 0;
    int totalComprados = 0;

    for (var categoria in categorias) {
      totalItens += categoria.itens.length;
      totalComprados += categoria.totalComprados;
    }

    return '$totalComprados de $totalItens itens no carrinho';
  }
}
