import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/model/categoria_model.dart';
import 'package:rancho_consciente/app/view_model/rancho_viewmodel.dart';
import 'package:rancho_consciente/app/widgets/cards/itens.card.dart';
import 'package:rancho_consciente/app/widgets/grid_builder.dart';

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

class _ItensViewState extends State<ItensView> {
  // Chave global para o formulário, essencial para acionar a validação
  final _formKey = GlobalKey<FormState>();

  // Controlador para o TextFormField, para acessar o texto digitado
  final TextEditingController _nameItemController = TextEditingController();

  // Variável para controlar o estado de carregamento/processamento do botão
  final bool _isProcessing = false;

  @override
  void dispose() {
    // É importante descartar o controlador quando o widget não for mais necessário
    _nameItemController.dispose();
    super.dispose();
  }

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
            onFieldSubmitted: (value) {
              if (value.isNotEmpty) {
                widget.ranchoViewModel.adicionarItem(
                  categoria: widget.categoriaModel,
                  nomeDigitado: value, // Aqui usamos o 'value'
                );
                _nameItemController
                    .clear(); // Aqui usamos o controller para resetar o campo
              }
            },
          ),

          Expanded(
            child: ListenableBuilder(
              listenable: widget.ranchoViewModel,
              builder: (context, child) => MyGridBuilder(
                colunas: 1,
                itemCount: widget.categoriaModel.itens.length,
                itemBuilder: (context, index) {
                  final itemAtual = widget.categoriaModel.itens[index];
                  return ItemCard(itemModel: itemAtual);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
