import 'package:flutter/material.dart';
import 'package:rancho_consciente/app/utils/date_picker.dart';

class AddRanchoForms extends StatefulWidget {
  const AddRanchoForms({super.key});

  @override
  State<AddRanchoForms> createState() => _AddRanchoFormsState();
}

class _AddRanchoFormsState extends State<AddRanchoForms> {
  // Chave global para o formulário, essencial para acionar a validação
  final _formKey = GlobalKey<FormState>();

  // Controlador para o TextFormField, para acessar o texto digitado
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  // Variável para controlar o estado de carregamento/processamento do botão
  final bool _isProcessing = false;

  @override
  void dispose() {
    // É importante descartar o controlador quando o widget não for mais necessário
    _nameController.dispose();
    _dateController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(
          context,
        ).viewInsets.bottom, // Empurra o modal para cima do teclado
      ),
      child: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.all(30),

          // color: Colors.deepPurpleAccent,
          height: 400,
          child: Column(
            spacing: 20,
            children: [
              Text('Criar lista de compras'),
              TextFormField(
                controller: _nameController,
                //style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  hint: Text(
                    'Nome do Mercado',
                    style: TextStyle(color: Colors.white24),
                  ),
                ),
              ),
              TextFormField(
                controller: _dateController,
                readOnly: true,

                decoration: InputDecoration(
                  hint: Text('Data', style: TextStyle(color: Colors.white24)),
                ),
                onTap: () async {
                  DateTime? data = await AppUtils.datePicker(context);
                  if (data != null) {
                    setState(() {
                      _dateController.text =
                          "${data.day}/${data.month.toString().padLeft(2, '0')}/${data.year}";
                    });
                  }
                },
              ),
              TextFormField(
                controller: _descriptionController,
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
      ),
    );
  }
}
