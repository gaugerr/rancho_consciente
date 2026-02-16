import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/view_model/rancho_viewmodel.dart';

class App extends StatelessWidget {
  final ranchoViewModel = RanchoViewmodel();

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
      body: GridView.builder(
        padding: const EdgeInsets.all(18),

        itemCount: ranchoViewModel.listasCompras.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final rancho = ranchoViewModel.listasCompras[index];
          return Card(
            color: Theme.of(
              context,
            ).colorScheme.surface, // Usa o cinza escuro do seu tema
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    rancho.mercado,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    rancho.data.toString(),
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    rancho.descricao,
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
