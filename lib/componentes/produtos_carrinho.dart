import 'package:flutter/material.dart';

class ProdutosCarrinho extends StatefulWidget {
  const ProdutosCarrinho({Key? key}) : super(key: key);
  @override
  State<ProdutosCarrinho> createState() => _ProdutosCarrinhoState();
}

class _ProdutosCarrinhoState extends State<ProdutosCarrinho> {
  //variável que popula o carrinho
  var prodCarrinho = [
    {
      "nome": 'Saints Row',
      "foto": ['images/produtos/saintsrow/1.png', 'images/produtos/saintsrow/2.png', 'images/produtos/saintsrow/3.png'],
      "preco": 120,
      "categoria": '',
      "lancamento": '23/08/22',
      "plataforma": 'PS5',
      "descricao": '',
      "quantidade": 1
    },
    
    {
      "nome": 'Stray',
      "foto": ['images/produtos/stray/1.png', 'images/produtos/stray/2.png', 'images/produtos/stray/3.png'],
      "preco": 120,
      "categoria": '',
      "lancamento": '19/07/2022',
      "plataforma": 'PC, PS4, PS5',
      "descricao": '',
      "quantidade": 1
    },
    {
      "nome": 'Horizon FW',
      "foto": ['images/produtos/horizonfw/1.png', 'images/produtos/horizonfw/2.png', 'images/produtos/horizonfw/3.png'],
      "preco": 120,
      "categoria": '',
      "lancamento": '18/02/2022',
      "plataforma": 'PC, PS4, PS5',
      "descricao": '',
      "quantidade": 1
    },
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: prodCarrinho.length,
      itemBuilder: (context, index) => ProdutoCarrinho(
          prodNomeCarrinho: prodCarrinho[index]["nome"],
          prodFotoCarrinho: prodCarrinho[index]['foto'],
          prodPrecoCarrinho: prodCarrinho[index]['preco'],
          prodCategoriaCarrinho: prodCarrinho[index]['categoria'],
          prodLancamentoCarrinho: prodCarrinho[index]['lancamento'], 
          prodPlataformaCarrinho: prodCarrinho[index]['plataforma'], 
          prodDescricaoCarrinho: prodCarrinho[index]['descricao'],
          prodQuantidadeCarrinho: prodCarrinho[index]['quantidade'],
      ),);
  }
}

class ProdutoCarrinho extends StatelessWidget {
  final dynamic prodNomeCarrinho;
  final dynamic prodFotoCarrinho;
  final dynamic prodPrecoCarrinho;
  final dynamic prodCategoriaCarrinho;
  final dynamic prodLancamentoCarrinho; 
  final dynamic prodPlataformaCarrinho; 
  final dynamic prodDescricaoCarrinho;
  final dynamic prodQuantidadeCarrinho;

  const ProdutoCarrinho({Key? key,
    this.prodNomeCarrinho,
    this.prodFotoCarrinho,
    this.prodPrecoCarrinho,
    this.prodCategoriaCarrinho,
    this.prodLancamentoCarrinho, 
    this.prodPlataformaCarrinho, 
    this.prodDescricaoCarrinho,
    this.prodQuantidadeCarrinho,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(prodFotoCarrinho[0], width: 80, height: 80,),
        title: Text(prodNomeCarrinho),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                //plataforma
                const Padding(padding: EdgeInsets.all(0),
                child: Text("Plataforma: ", style: TextStyle(fontSize: 12),)
                ,),
                Padding(padding: const EdgeInsets.all(1),
                child: Text(prodPlataformaCarrinho, style: const TextStyle(fontSize: 12),)
                ),
              ],
            ),

            Row(
              children: <Widget>[
                const Padding(padding: EdgeInsets.all(0),
                child: Text("Lançamento:", style: TextStyle(fontSize: 12),),),
                Padding(padding: const EdgeInsets.all(1),
                child: Text(prodLancamentoCarrinho, style: const TextStyle(fontSize: 12),)
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text('R\$: $prodPrecoCarrinho', style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 14, 133, 16))),),
          ],
        ),
      ),
    );
}
}