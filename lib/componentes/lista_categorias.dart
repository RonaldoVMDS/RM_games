import 'package:flutter/material.dart';

class ListaCategorias extends StatelessWidget {
  const ListaCategorias({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const <Widget>[
          Categoria(
              imagem: 'images/categorias/categoria-acao.png',
              legendaImagem: 'Ação'),
          Categoria(
              imagem: 'images/categorias/categoria-estrategia.png',
              legendaImagem: 'Estratégia'),
          Categoria(
              imagem: 'images/categorias/categoria-rpg.png',
              legendaImagem: 'RPG'),
          Categoria(
              imagem: 'images/categorias/categoria-survival.png',
              legendaImagem: 'Survival'),
        ],
      ),
    );
  }
}

class Categoria extends StatelessWidget {
  final String imagem;
  final String legendaImagem;

  const Categoria({Key? key, required this.imagem, required this.legendaImagem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imagem,
              width: 100.0,
              height: 70.0,
            ),
            subtitle: Container(
                alignment: Alignment.topCenter, child: Text(legendaImagem)),
          ),
        ),
      ),
    );
  }
}
