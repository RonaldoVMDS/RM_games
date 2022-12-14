import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:rm_games/models/produto.dart';
import 'package:rm_games/paginas/admin.dart';
import 'package:rm_games/paginas/produto_detalhes.dart';
import 'package:rm_games/repositorios/produto_repositorio.dart';
import '../componentes/lista_categorias.dart';
import 'package:provider/provider.dart';
import 'login.dart';
import 'carrinho.dart';
import 'tela_principal.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({Key? key}) : super(key: key);

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  mostrarDetalhes(Produto produto) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => ProdutoDetalhes(produto: produto)));
  }

  final _firebaseAuth = FirebaseAuth.instance;
  String email = '';
  String uid = '';
  List<Reference> refs = [];
  String imagem_usuario = '';
  bool loading = true;

  @override
  // ignore: must_call_super
  void initState() {
    recebeUsuario();
    loadImages();
  }

  loadImages() async {
    refs = (await FirebaseStorage.instance.ref('images').listAll()).items;
    for (var ref in refs) {
      if (ref.fullPath == 'images/$uid.jpg') {
        imagem_usuario = await ref.getDownloadURL();
      }
      setState(() {
        loading = false;
      });
    }
  }

  recebeUsuario() async {
    User? usuario = _firebaseAuth.currentUser;
    if (usuario != null) {
      setState(() {
        email = usuario.email!;
        uid = usuario.uid;
      });
    }
  }

  late List<Produto> tabela;
  late ProdutoRepositorio produtos;

  @override
  Widget build(BuildContext context) {
    produtos = context.watch<ProdutoRepositorio>();
    tabela = produtos.tabela;
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
              accountName: const Text('Usu??rio Teste'),
              accountEmail: Text(email),
              currentAccountPicture: GestureDetector(
                child: loading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : CircleAvatar(
                        radius: 75,
                        backgroundColor: const Color.fromARGB(255, 7, 175, 180),
                        backgroundImage: imagem_usuario != ''
                            ? NetworkImage(imagem_usuario)
                            : const NetworkImage('')),
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
                title: Text('P??gina Inicial'),
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
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
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
        //come??o do corpo da pag produtos
        children: <Widget>[
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

          //Texto Jogos A????o
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text(
                  "Jogos de a????o  ",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 14, 133, 16)),
                ),
                const Icon(Icons.videogame_asset_outlined, color: Colors.black),
              ],
            ),
          ),
          //Fim texto Jogos A????o
          //Grid de jogos A????o

          SizedBox(
            height: 600.00,
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
                    child: Image.network(
                      tabela[produto].prodFoto[0],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
