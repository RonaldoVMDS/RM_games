import 'package:flutter/material.dart';
import 'package:rm_games/componentes/produtos_carrinho.dart';

class Carrinho extends StatefulWidget {
  const Carrinho({Key? key}) : super(key: key);

  @override
  State<Carrinho> createState() => _CarrinhoState();
}

class _CarrinhoState extends State<Carrinho> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text('Meu Carrinho'),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), color: Colors.white, onPressed: () {  },),
        ],
      ),

      body: const ProdutosCarrinho(),

      bottomNavigationBar: Container(
        color: Colors.black.withOpacity(0.4),
        child: Row(
          children: <Widget>[
            const Expanded(
              child: ListTile(
                title: Text("Total", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                subtitle: Text("R\$: 120", style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(255, 0, 255, 0))),
              ),
              ),

              Expanded(
                child: MaterialButton(onPressed: (){}, color: const Color.fromARGB(255, 14, 133, 16),
                child: const Text("Pagar", style: TextStyle(color: Colors.white)),),
                )
          ],
        ),
      ),
    );
  }
}