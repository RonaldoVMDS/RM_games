import 'package:flutter/material.dart';

import '../componentes/lista_categorias.dart';
import '../componentes/produtos.dart';
import 'login.dart';
import 'carrinho.dart';
import 'tela_principal.dart';

class ProdutosPag extends StatefulWidget {
  const ProdutosPag({Key? key}) : super(key: key);

  @override
  State<ProdutosPag> createState() => _ProdutosPagState();
}

class _ProdutosPagState extends State<ProdutosPag> {
  @override
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
        //começo do corpo da pag produtos
        children: <Widget>[
          //Texto categorias
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text('Categorias', 
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 133, 16)),),),
          //Fim texto categorias

          //Lista de categorias
          const ListaCategorias(),
          //Fim Lista de categorias

          //Texto Jogos Ação
          Padding(
            padding: const EdgeInsets.all(12.0),
             child: Row(
               // ignore: prefer_const_literals_to_create_immutables
               children: [
                 const Text("Jogos de ação  ", 
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 133, 16)),),
                  const Icon(Icons.videogame_asset_outlined, color: Colors.black),
               ],
             ),),
          //Fim texto Jogos Ação
          //Grid de jogos Ação

          // ignore: prefer_const_constructors
          SizedBox(
            height: 600.00,
            child:  const Produtos(),
          ),

          //Grid de jogos Ação

          // //Texto Jogos Estratégia
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //    child: Row(
          //      // ignore: prefer_const_literals_to_create_immutables
          //      children: [
          //        const Text("Jogos de estratégia  ", 
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 133, 16)),),
          //         const Icon(Icons.castle_sharp, color: Colors.black),
          //      ],
          //    ),),
          // //Fim texto Estratégia
          // //Grid de jogos Estratégia

          // // ignore: prefer_const_constructors
          // SizedBox(
          //   height: 500.00,
          //   child:  const Produtos(),
          // ),

          // //Grid de jogos Estratégia

          // //Texto Jogos RPG
          // Padding(
          //   padding: const EdgeInsets.all(12.0),
          //    child: Row(
          //      // ignore: prefer_const_literals_to_create_immutables
          //      children: [
          //        const Text("Jogos de RPG  ", 
          //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 14, 133, 16)),),
          //         const Icon(Icons.person, color: Colors.black),
          //      ],
          //    ),),
          // //Fim texto Jogos RPG
          // //Grid de jogos RPG

          // // ignore: prefer_const_constructors
          // SizedBox(
          //   height: 500.00,
          //   child:  const Produtos(),
          // )

          //Grid de jogos RPG
        ],
      ),
    );
  }
}