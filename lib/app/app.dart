import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/view_model/rancho_viewmodel.dart';
import 'package:rancho_consciente/app/widgets/cards/rancho_card.dart';

class App extends StatelessWidget {
  final ranchoViewModel = RanchoViewmodel();

  App({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Rancho Consciente')),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(
                    context,
                  ).viewInsets.bottom, // Empurra o modal para cima do teclado
                ),
                child: Container(
                  padding: EdgeInsets.all(30),

                  // color: Colors.deepPurpleAccent,
                  height: 400,
                  child: Column(
                    spacing: 20,
                    children: [
                      Text('Criar lista de compras'),
                      TextFormField(
                        //style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hint: Text(
                            'Nome do Mercado',
                            style: TextStyle(color: Colors.white24),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hint: Text(
                            'Data',
                            style: TextStyle(color: Colors.white24),
                          ),
                        ),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hint: Text(
                            'Descrição',
                            style: TextStyle(color: Colors.white24),
                          ),
                        ),
                      ),
                      //   SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shadowColor: Colors.deepPurpleAccent,
                          elevation: 6,

                          backgroundColor: Colors.deepPurpleAccent,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Criar',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
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
          return RanchoCard(rancho: rancho);
        },
      ),
    );
  }
}
