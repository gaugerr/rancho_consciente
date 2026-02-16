import 'item_model.dart';

class CategoriaModel {
  String tituloCategoria;
  List<ItemModel> itens;
  bool isExpandida;

  CategoriaModel({
    required this.tituloCategoria,
    required this.itens,
    this.isExpandida = true,
  });

  double get totalCategoria {
    return itens.fold(0, (soma, item) => soma + item.preco);
  }

  int get totalComprados {
    return itens.where((item) => item.isComprado).length;
  }

  // Lista Estática com as 5 categorias padrão
  static List<CategoriaModel> gerarCategoriasPadrao() {
    return [
      CategoriaModel(tituloCategoria: 'Essencias', itens: []),
      CategoriaModel(tituloCategoria: 'Higiene e Limpeza', itens: []),
      CategoriaModel(tituloCategoria: 'Hortifruti', itens: []),
      CategoriaModel(tituloCategoria: 'Padaria e Laticínios', itens: []),
      CategoriaModel(tituloCategoria: 'Carnes', itens: []),
      CategoriaModel(tituloCategoria: 'Bebidas', itens: []),
      CategoriaModel(tituloCategoria: 'Diversos', itens: []),
    ];
  }
}
