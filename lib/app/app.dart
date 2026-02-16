import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/model/categoria_model.dart';
import 'package:rancho_consciente/app/model/rancho_model.dart';

class App extends StatelessWidget {
  final List<RanchoModel> listasCompras = [
    RanchoModel(
      mercado: 'Mercado Dália',
      data: DateTime.now(),
      categorias: CategoriaModel.gerarCategoriasPadrao(),
      descricao: 'Descricao detalhada',
    ),
  ];
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Rancho Consciente')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Criar nova lista de compras'),
        icon: Icon(Icons.add_shopping_cart_outlined),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        // Aqui a mágica acontece: transformamos dados em Widgets
        children: listasCompras
            .map(
              (item) => Card(
                color: Theme.of(
                  context,
                ).colorScheme.surface, // Usa o cinza escuro do seu tema
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.mercado,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        item.data.toString(),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.descricao,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(), // O map retorna um Iterable, o toList() converte de volta para a lista que o children quer
      ),
    );
  }
}
