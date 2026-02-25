import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/model/item_model.dart';
import 'package:rancho_consciente/app/view_model/rancho_viewmodel.dart';

class ItemCard extends StatefulWidget {
  final RanchoViewModel ranchoViewModel;
  final ItemModel itemModel;
  const ItemCard({
    super.key,
    required this.itemModel,
    required this.ranchoViewModel,
  });

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  //key pra o Form() pra usar a validação
  final _formKey = GlobalKey<FormState>();

  // Controladores para acessar o texto digitado
  final TextEditingController _qtdController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();

  // Variável para controlar o estado de carregamento/processamento do botão
  //final bool _isProcessing = false;

  @override
  void dispose() {
    //descartar controladores pra evitar memory leak
    _qtdController.dispose();
    _precoController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Inicializamos os controllers com os valores que já existem no Model
    _qtdController.text = widget.itemModel.quantidade.toString();
    _precoController.text = widget.itemModel.preco.toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Checkbox(
                  value: widget.itemModel.isComprado,
                  onChanged: (bool? value) => {
                    widget.ranchoViewModel.toggleIsComprado(widget.itemModel),
                  },
                ),

                Text(
                  widget.itemModel.nomeItem,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: widget.itemModel.isComprado
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
              ],
            ),
            Form(
              key: _formKey,
              child: Row(
                children: [
                  if (widget.itemModel.isComprado) ...[
                    const SizedBox(width: 10),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: widget.itemModel.unidade, // "un", "kg", ou "l"
                        decoration: const InputDecoration(
                          labelText: 'Unidade',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                        ),
                        items: ['un', 'kg', 'L'].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (novoValor) {},
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        controller: _qtdController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text('Quantidade'),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                        ),
                        onTap: () {
                          _qtdController.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: _qtdController.text.length,
                          );
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        controller: _precoController,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),

                        decoration: InputDecoration(
                          border: InputBorder.none,
                          label: Text('Preço'),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                        ),
                        onTap: () {
                          _precoController.selection = TextSelection(
                            baseOffset: 0,
                            extentOffset: _precoController.text.length,
                          );
                        },
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
