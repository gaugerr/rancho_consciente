import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/model/item_model.dart';

class ItemCard extends StatelessWidget {
  final ItemModel itemModel;
  const ItemCard({super.key, required this.itemModel});

  @override
  Widget build(BuildContext context) {
    return Card(child: Row(children: [Text(itemModel.nomeItem)]));
  }
}
