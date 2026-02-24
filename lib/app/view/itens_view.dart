import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/model/categoria_model.dart';
import 'package:rancho_consciente/app/view_model/rancho_viewmodel.dart';

class ItensView extends StatefulWidget {
  final RanchoViewModel ranchoViewModel;
  final CategoriaModel categoriaModel;
  const ItensView({
    super.key,
    required this.categoriaModel,
    required this.ranchoViewModel,
  });

  @override
  State<ItensView> createState() => _ItensViewState();
}

// Chave global para o formulário, essencial para acionar a validação
final _formKey = GlobalKey<FormState>();

// Controlador para o TextFormField, para acessar o texto digitado
final TextEditingController _nameItemController = TextEditingController();

// Variável para controlar o estado de carregamento/processamento do botão
final bool _isProcessing = false;

class _ItensViewState extends State<ItensView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.categoriaModel.tituloCategoria),
      ),
      body: Column(
        children: [
          TextFormField(
            key: _formKey,
            controller: _nameItemController,
            onFieldSubmitted: (value) {},
          ),

          // MyGridBuilder(
          //   colunas: 1,
          //   itemCount: categoriaModel.itens.length,
          //   itemBuilder: (context, index) {
          //     final itemAtual = categoriaModel.itens[index];
          //     return ItemCard(itemModel: itemAtual);
          //   },
          // ),
        ],
      ),
    );
  }
}
