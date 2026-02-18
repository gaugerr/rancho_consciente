class ItemModel {
  final String id;
  final String nomeItem;
  final double preco;
  bool isComprado;

  ItemModel({
    required this.id,
    required this.nomeItem,
    this.preco = 0.0,
    this.isComprado = false,
  });

  void toggleIsComprado() {
    isComprado = !isComprado;
  }
}
