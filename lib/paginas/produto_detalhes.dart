// ignore_for_file: prefer_typing_uninitialized_variables
// ignore: import_of_legacy_library_into_null_safe
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:rm_games/componentes/carrossel_imagens-produto.dart';
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
            height: 260,
            child: GridTile(
              child: Container(
                child: carrosselImagensProduto = SizedBox(
                  height: 260.0,
                  child: Carousel(
                    boxFit: BoxFit.cover,
                    // ignore: prefer_const_literals_to_create_immutables
                    images: [
                      AssetImage("${widget.prodDetalhesFoto[0]}"),
                      AssetImage("${widget.prodDetalhesFoto[1]}"),
                      AssetImage("${widget.prodDetalhesFoto[2]}"),
                    ], 
        dotSize: 3,
        showIndicator: false,
        indicatorBgPadding: 3.5,
        dotIncreaseSize: 3,
        autoplay: true,
        animationDuration: const Duration(milliseconds: 1300),
      ),
    ),
    )
              )
              ),
        ],
      ),

    );
  }
}