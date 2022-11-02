import 'package:flutter/material.dart';
import 'package:rm_games/componentes/carrossel_imagens.dart';
// ignore: import_of_legacy_library_into_null_safe

//----------//

import 'package:rm_games/componentes/lista_categorias.dart';
import 'package:rm_games/componentes/produtos.dart';
import 'package:rm_games/login.dart';
import 'package:rm_games/paginas/carrinho.dart';
import 'package:rm_games/paginas/produtos.dart';

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text('RM Games', ),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), color: Colors.white, onPressed: () {  },),
          IconButton(icon: const Icon(Icons.shopping_cart), color: Colors.white, onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const Carrinho())); },),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Ronaldo Vinicius'),
              accountEmail: const Text('ronaldovinicius@alunos.utfpr.edu.br'),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 7, 175, 180),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
            
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const TelaPrincipal()));
              },
              child: const ListTile(
                title: Text('Página Inicial'),
                leading: Icon(Icons.home, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProdutosPag()));
              },
              child: const ListTile(
                title: Text('Todos os Jogos'),
                leading: Icon(Icons.gamepad, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Carrinho()));
              },
              child: const ListTile(
                title: Text('Meu Carrinho'),
                leading: Icon(Icons.shopping_cart, color: Colors.green),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
              },
              child: const ListTile(
                title: Text('Sair'),
                leading: Icon(Icons.logout_sharp),
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        //começo do corpo da pag inicial
        children: <Widget>[
          //banner
          carrosselImagens,
          //banner
          //Texto categorias
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Categorias', 
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 133, 16)),),),
          //Fim texto categorias

          //Lista de categorias
          const ListaCategorias(),
          //Fim Lista de categorias

          //Texto Lançamentos
          Padding(
            padding: const EdgeInsets.all(12.0),
             child: Row(
               // ignore: prefer_const_literals_to_create_immutables
               children: [
                 const Text("Lançamentos", 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 133, 16)),),
                  const Icon(Icons.star, color: Colors.orange),
               ],
             ),),

          //Fim texto Lançamentos

          //Grid de jogos em lançamento

          // ignore: prefer_const_constructors
          SizedBox(
            height: 450.00,
            child:  const Produtos(),
          )

          //Grid de jogos em lançamento

        ],
      ),
    );
  }
}
