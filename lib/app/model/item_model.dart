class ItemModel {
  String id;
  String nomeItem;
  double preco;
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
