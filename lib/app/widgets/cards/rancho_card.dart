import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/model/rancho_model.dart';
import 'package:rancho_consciente/app/view/categorias_view.dart';

class RanchoCard extends StatelessWidget {
  final RanchoModel rancho;
  const RanchoCard({super.key, required this.rancho});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(
        context,
      ).colorScheme.surface, // Usa o cinza escuro do seu tema
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (_) => CategoriasView(ranchoModel: rancho),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Text('id = ${rancho.id}'),
              Text(
                rancho.mercado,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                //  rancho.data.toString(),
                "${rancho.data.day.toString().padLeft(2, '0')}/${rancho.data.month.toString().padLeft(2, '0')}/${rancho.data.year}",
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
      ),
    );
  }
}
