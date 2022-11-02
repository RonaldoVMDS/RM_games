import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:rm_games/paginas/carrinho.dart';

class ProdutoDetalhes extends StatefulWidget {
  final dynamic prodDetalhesNome;
  final dynamic prodDetalhesFoto;
  final dynamic prodDetalhesPreco;
  final dynamic prodDetalhesCategoria;
  final dynamic prodDetalhesLancamento; 
  final dynamic prodDetalhesPlataforma; 
  final dynamic prodDetalhesDescricao;

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
  options: CarouselOptions(height: 200.0, enlargeCenterPage: true, autoPlay: true,),
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
              ),
              Container(
                height: 50,
                alignment: Alignment.center, 
                child: Text(
                  "${widget.prodDetalhesNome} - RS ${widget.prodDetalhesPreco}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 30),
                )),
                Container(
                height: 120,
                alignment: Alignment.center, 
                child: Text(
                  "${widget.prodDetalhesDescricao}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                )),
                Container(
                height: 80,
                alignment: Alignment.center, 
                child: Text(
                  "Plataformas: ${widget.prodDetalhesPlataforma}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                )),
                Container(
                height: 80,
                alignment: Alignment.center, 
                child: Text(
                  "Categoria: ${widget.prodDetalhesCategoria}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 15),
                )),
                const SizedBox(height: 20),
                _botaoComprar(),
        ],
      ),

    );
  }

  Widget _botaoComprar(){
    return ElevatedButton(onPressed: (){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Item adicionado ao carrinho!", textAlign: TextAlign.center,),
        backgroundColor: Colors.green,)
      );
  }, style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 14, 133, 16),
        onPrimary: const Color.fromARGB(255, 255, 255, 255),
      ), 
  child: const SizedBox(
    width: double.infinity,
    child: Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Comprar", 
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 32),
        ),
    )),);
}
}
