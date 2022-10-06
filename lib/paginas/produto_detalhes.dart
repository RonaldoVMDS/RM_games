// ignore_for_file: prefer_typing_uninitialized_variables
// ignore: import_of_legacy_library_into_null_safe

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rm_games/paginas/carrinho.dart';

class ProdutoDetalhes extends StatefulWidget {
  final prodDetalhesNome;
  final prodDetalhesFoto;
  final prodDetalhesPreco;
  final prodDetalhesCategoria;
  final prodDetalhesLancamento; 
  final prodDetalhesPlataforma; 
  final prodDetalhesDescricao;

  const ProdutoDetalhes({Key? key,
      this.prodDetalhesNome,
      this.prodDetalhesFoto,
      this.prodDetalhesPreco,
      this.prodDetalhesCategoria,
      this.prodDetalhesLancamento, 
      this.prodDetalhesPlataforma, 
      this.prodDetalhesDescricao,
  
  }) : super(key: key);

  @override
  State<ProdutoDetalhes> createState() => _ProdutoDetalhesState();
}

class _ProdutoDetalhesState extends State<ProdutoDetalhes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text('RM Games'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), color: Colors.white, onPressed: () {  },),
          IconButton(icon: const Icon(Icons.shopping_cart), color: Colors.white, onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Carrinho())); },),
        ],
      ),

      body: ListView(
        children: <Widget>[
          SizedBox(
              child: CarouselSlider(
  options: CarouselOptions(height: 220.0, enlargeCenterPage: true, autoPlay: true,),
  items: ['${widget.prodDetalhesFoto[0]}', '${widget.prodDetalhesFoto[1]}', '${widget.prodDetalhesFoto[2]}'].map((i) {
    return Builder(
      builder: (BuildContext context) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image.asset(i)
          )
        );
      },
    );
  }).toList(),
),
              )
        ],
      ),

    );
  }
}