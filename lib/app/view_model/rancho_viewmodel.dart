import 'package:rancho_consciente/app/model/categoria_model.dart';
import 'package:rancho_consciente/app/model/rancho_model.dart';

class RanchoViewmodel {
  final List<RanchoModel> listasCompras = [
    RanchoModel(
      mercado: 'Mercado Dália',
      data: '20/02/2012',
      categorias: CategoriaModel.gerarCategoriasPadrao(),
      descricao: 'Descricao detalhada',
    ),
    RanchoModel(
      mercado: 'Mercado Marel',
      data: '10/20/2131',
      categorias: CategoriaModel.gerarCategoriasPadrao(),
      descricao: 'Descrição do rancho atual',
    ),
    RanchoModel(
      mercado: 'Mercado Desco',
      data: '20/30/3212',
      categorias: CategoriaModel.gerarCategoriasPadrao(),
      descricao: 'Rancho no mercadao descooooooo',
    ),

    RanchoModel(
      mercado: 'Mercado Dália',
      data: '20/02/2012',
      categorias: CategoriaModel.gerarCategoriasPadrao(),
      descricao: 'Descricao detalhada',
    ),
    RanchoModel(
      mercado: 'Mercado Marel',
      data: '10/20/2131',
      categorias: CategoriaModel.gerarCategoriasPadrao(),
      descricao: 'Descrição do rancho atual',
    ),
  ];

  //TODO funções pra adicionar etc
}
