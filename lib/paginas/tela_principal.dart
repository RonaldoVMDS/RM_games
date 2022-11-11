import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rm_games/componentes/carrossel_imagens.dart';

//----------//

import 'package:rm_games/componentes/lista_categorias.dart';
import 'package:rm_games/paginas/admin.dart';
import 'package:rm_games/paginas/carrinho.dart';
import 'package:rm_games/paginas/produto_detalhes.dart';
import 'package:rm_games/paginas/produtos_page.dart';
import 'package:rm_games/repositorios/produto_repositorio.dart';
import 'package:rm_games/servicos/auth_service.dart';
import 'package:provider/provider.dart';

import '../models/produto.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  mostrarDetalhes(Produto produto) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => ProdutoDetalhes(produto: produto)));
  }

  final _firebaseAuth = FirebaseAuth.instance;
  String email = '';

  @override
  // ignore: must_call_super
  void initState() { 
    recebeUsuario();
    
  }

  recebeUsuario() async {
    User? usuario = _firebaseAuth.currentUser;
    if(usuario != null){
      setState(() {
      email = usuario.email!;
    });
    }
    
  }

  @override
  Widget build(BuildContext context) {
    final tabela = ProdutoRepositorio.tabela;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: const Text(
          'RM Games',
        ),
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
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: const Text('Usuário Teste'),
              accountEmail: Text(email),
              currentAccountPicture: GestureDetector(
                child: const CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 7, 175, 180),
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TelaPrincipal()));
              },
              child: const ListTile(
                title: Text('Página Inicial'),
                leading: Icon(Icons.home, color: Colors.blue),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProdutosPage()));
              },
              child: const ListTile(
                title: Text('Todos os Jogos'),
                leading: Icon(Icons.gamepad, color: Colors.red),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Carrinho()));
              },
              child: const ListTile(
                title: Text('Meu Carrinho'),
                leading: Icon(Icons.shopping_cart, color: Colors.green),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Admin()));
              },
              child: const ListTile(
                title: Text('Administrador'),
                leading: Icon(Icons.person, color: Colors.yellow),
              ),
            ),
            InkWell(
              onTap: () => context.read<AuthService>().logout(),
              child: const ListTile(
                title: Text('Sair'),
                leading: Icon(Icons.logout_sharp),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        //começo do corpo da pag inicial
        children: <Widget>[
          //banner
          carrosselImagens,
          //banner
          //Texto categorias
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Categorias',
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 14, 133, 16)),
            ),
          ),
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
                const Text(
                  "Lançamentos",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 14, 133, 16)),
                ),
                const Icon(Icons.star, color: Colors.orange),
              ],
            ),
          ),

          //Fim texto Lançamentos

          //Grid de jogos em lançamento

          Flexible(
            child: GridView.builder(
              itemCount: tabela.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemBuilder: (context, int produto) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: InkWell(
                  onTap: () => mostrarDetalhes(tabela[produto]),
                  child: GridTile(
                    footer: Container(
                      color: Colors.black.withOpacity(0.5),
                      child: ListTile(
                        leading: Container(
                          width: 60,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            tabela[produto].prodNome,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        title: Container(
                            width: 35,
                            alignment: Alignment.centerRight,
                            child: Text("R\$: ${tabela[produto].prodPreco}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 38, 255, 45)))),
                      ),
                    ),
                    child: Image.asset(
                      tabela[produto].prodFoto[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )

          //Grid de jogos em lançamento
        ],
      ),
    );
  }
}
