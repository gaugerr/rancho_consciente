import 'categoria_model.dart';

class RanchoModel {
  final String id;
  final String mercado;
  final String data;
  final String descricao;
  final List<CategoriaModel> categorias;

  RanchoModel({
    required this.id,
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
