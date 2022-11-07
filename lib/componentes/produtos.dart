import 'package:flutter/material.dart';
import 'package:rm_games/paginas/produto_detalhes.dart';

class Produtos extends StatefulWidget {
  const Produtos({Key? key}) : super(key: key);

  @override
  State<Produtos> createState() => _ProdutosState();
}

class _ProdutosState extends State<Produtos> {
  var listaProdutos = [
    {
      "nome": 'Saints Row',
      "foto": [
        'images/produtos/saintsrow/1.png',
        'images/produtos/saintsrow/2.png',
        'images/produtos/saintsrow/3.png'
      ],
      "preco": 120,
      "categoria": '',
      "lancamento": '23/08/2022',
      "plataforma": 'PC, PS4, PS5',
      "descricao":
          'Este jogo, pode ser adquirido para PS4, PS5 e também para computador. Uma bela recomendação para um amante de jogos',
    },
    {
      "nome": 'Elden Ring',
      "foto": [
        'images/produtos/eldenring/1.png',
        'images/produtos/eldenring/2.png',
        'images/produtos/eldenring/3.png'
      ],
      "preco": 120,
      "categoria": '',
      "lancamento": '25/02/2022',
      "plataforma": 'PC, PS4, PS5',
      "descricao":
          'Este jogo, pode ser adquirido para PS4, PS5 e também para computador. Uma bela recomendação para um amante de jogos',
    },
    {
      "nome": 'Dying Light 2',
      "foto": [
        'images/produtos/dyinglight2/1.png',
        'images/produtos/dyinglight2/2.png',
        'images/produtos/dyinglight2/3.png'
      ],
      "preco": 120,
      "categoria": '',
      "lancamento": '04/02/2022',
      "plataforma": 'PC, PS4, PS5',
      "descricao":
          'Este jogo, pode ser adquirido para PS4, PS5 e também para computador. Uma bela recomendação para um amante de jogos',
    },
    {
      "nome": 'Stray',
      "foto": [
        'images/produtos/stray/1.png',
        'images/produtos/stray/2.png',
        'images/produtos/stray/3.png'
      ],
      "preco": 120,
      "categoria": '',
      "lancamento": '19/07/2022',
      "plataforma": 'PC, PS4, PS5',
      "descricao":
          'Este jogo, pode ser adquirido para PS4, PS5 e também para computador. Uma bela recomendação para um amante de jogos',
    },
    {
      "nome": 'Horizon FW',
      "foto": [
        'images/produtos/horizonfw/1.png',
        'images/produtos/horizonfw/2.png',
        'images/produtos/horizonfw/3.png'
      ],
      "preco": 120,
      "categoria": '',
      "lancamento": '18/02/2022',
      "plataforma": 'PC, PS4, PS5',
      "descricao":
          'Este jogo, pode ser adquirido para PS4, PS5 e também para computador. Uma bela recomendação para um amante de jogos',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: listaProdutos.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Produto(
                prodNome: listaProdutos[index]['nome'],
                prodFoto: listaProdutos[index]['foto'],
                prodPreco: listaProdutos[index]['preco'],
                prodCategoria: listaProdutos[index]['categoria'],
                prodLancamento: listaProdutos[index]['lancamento'],
                prodPlataforma: listaProdutos[index]['plataforma'],
                prodDescricao: listaProdutos[index]['descricao'],
              ),
            ));
  }
}

class Produto extends StatelessWidget {
  final dynamic prodNome;
  final dynamic prodFoto;
  final dynamic prodPreco;
  final dynamic prodCategoria;
  final dynamic prodLancamento;
  final dynamic prodPlataforma;
  final dynamic prodDescricao;

  const Produto({
    Key? key,
    this.prodNome,
    this.prodFoto,
    this.prodPreco,
    this.prodCategoria,
    this.prodLancamento,
    this.prodPlataforma,
    this.prodDescricao,
  }) : super(key: key);

  //retorna a lista de produtos que são lançamento
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Hero(
      tag: prodNome,
      child: Material(
        child: InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute
              //passando as informações do produto para a pagina de detalhes do produto
              (
                  builder: ((context) => ProdutoDetalhes(
                        prodDetalhesNome: prodNome,
                        prodDetalhesFoto: prodFoto,
                        prodDetalhesPreco: prodPreco,
                        prodDetalhesCategoria: prodCategoria,
                        prodDetalhesLancamento: prodLancamento,
                        prodDetalhesPlataforma: prodPlataforma,
                        prodDetalhesDescricao: prodDescricao,
                      )))),
          child: GridTile(
            footer: Container(
              color: Colors.black.withOpacity(0.5),
              child: ListTile(
                leading: Container(
                  width: 60,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    prodNome,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                title: Container(
                    width: 35,
                    alignment: Alignment.centerRight,
                    child: Text("R\$: $prodPreco",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 38, 255, 45)))),
              ),
            ),
            child: Image.asset(
              prodFoto[0],
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ));
  }
}
