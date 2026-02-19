import 'package:flutter/material.dart';

class BottomSheetAdd extends StatelessWidget {
  const BottomSheetAdd({super.key});

  @override
  Widget build(BuildContext context) {
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
                hint: Text('Data', style: TextStyle(color: Colors.white24)),
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
              child: Text('Criar', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
