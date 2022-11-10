import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rm_games/componentes/divider.dart';
import 'package:rm_games/models/produto.dart';
import 'package:rm_games/paginas/carrinho.dart';
import 'package:rm_games/repositorios/carrinho_repositorio.dart';

class ProdutoDetalhes extends StatefulWidget {
  final Produto produto;

  const ProdutoDetalhes({
    Key? key,
    required this.produto
  }) : super(key: key);

  @override
  State<ProdutoDetalhes> createState() => _ProdutoDetalhesState();
}

class _ProdutoDetalhesState extends State<ProdutoDetalhes> {
  late CarrinhoRepositorio carrinho;

  @override
  Widget build(BuildContext context) {
    carrinho = Provider.of<CarrinhoRepositorio>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text('RM Games'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            color: Colors.white,
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            color: Colors.white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Carrinho()));
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            child: CarouselSlider(
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
              ),
              items: [
                (widget.produto.prodFoto[0]),
                (widget.produto.prodFoto[1]),
                (widget.produto.prodFoto[2])
              ].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child:
                            FittedBox(fit: BoxFit.fill, child: Image.asset(i)));
                  },
                );
              }).toList(),
            ),
          ),
          Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: Text(
                          widget.produto.prodNome,
                          maxLines: 2,
                          style: const TextStyle(
                              fontSize: 22.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        "R\$ ${widget.produto.prodPreco}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromRGBO(0, 0, 0, 0.7)),
                      )
                    ],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MaterialButton(
                        onPressed: () {
                          carrinho.saveAll(widget.produto);
                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              "Item adicionado ao carrinho!",
                              textAlign: TextAlign.center,
                            ),
                            backgroundColor: Colors.green,
                          ));
                        },
                        color: const Color.fromARGB(255, 14, 133, 16),
                        textColor: Colors.white,
                        elevation: 0.2,
                        child: const Text("Adicionar ao Carrinho"),
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(widget.produto.prodDescricao,
                        style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 19,
                            color: Color.fromRGBO(0, 0, 0, 0.7))),
                  ),
                ),
                divisor,
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text("Categorias: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromRGBO(0, 0, 0, 0.7))),
                        Text(widget.produto.prodCategoria,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 19,
                                color: Color.fromRGBO(0, 0, 0, 0.7))),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        const Text("Plataformas: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromRGBO(0, 0, 0, 0.7))),
                        Text(widget.produto.prodPlataforma,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 19,
                                color: Color.fromRGBO(0, 0, 0, 0.7))),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const Text("Data de Laçamento: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Color.fromRGBO(0, 0, 0, 0.7))),
                        Text(widget.produto.prodLancamento,
                            style: const TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 19,
                                color: Color.fromRGBO(0, 0, 0, 0.7))),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
