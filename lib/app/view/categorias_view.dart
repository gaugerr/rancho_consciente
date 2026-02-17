import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/model/rancho_model.dart';
import 'package:rancho_consciente/app/widgets/cards/categorias_card.dart';

class CategoriasView extends StatelessWidget {
  final RanchoModel ranchoModel;
  const CategoriasView({super.key, required this.ranchoModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(ranchoModel.mercado)),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {},
      //   label: Text('Criar nova lista de compras'),
      //   icon: Icon(Icons.add_shopping_cart_outlined),
      // ),
      body: GridView.builder(
        padding: const EdgeInsets.all(18),

        itemCount: ranchoModel.categorias.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final categorias = ranchoModel.categorias[index];
          return CategoriasCard(categorias: categorias);
        },
      ),
    );
  }
}
