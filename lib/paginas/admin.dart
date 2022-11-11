// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:rm_games/paginas/adicionar_produto.dart';

import 'carrinho.dart';
import 'login.dart';
import 'produtos_page.dart';
import 'tela_principal.dart';
// import 'package:fluttertoast/fluttertoast.dart';

enum Page { dashboard, manage }

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Page _selectedPage = Page.dashboard;
  MaterialColor active = Colors.green;
  MaterialColor notActive = Colors.grey;
  TextEditingController categoryController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.dashboard);
                      },
                      icon: Icon(
                        Icons.dashboard,
                        color: _selectedPage == Page.dashboard
                            ? active
                            : notActive,
                      ),
                      label: const Text('Dashboard'))),
              Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        setState(() => _selectedPage = Page.manage);
                      },
                      icon: Icon(
                        Icons.sort,
                        color:
                            _selectedPage == Page.manage ? active : notActive,
                      ),
                      label: const Text('Novo'))),
            ],
          ),
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.green,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProdutosPage()));
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
        body: _loadScreen());
  }

  Widget _loadScreen() {
    switch (_selectedPage) {
      case Page.dashboard:
        return Column(
          children: <Widget>[
            ListTile(
              subtitle: FlatButton.icon(
                onPressed: null,
                icon: const Icon(
                  Icons.attach_money,
                  size: 30.0,
                  color: Colors.green,
                ),
                label: const Text('12,000',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30.0, color: Colors.green)),
              ),
              title: const Text(
                'Ganhos',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.grey),
              ),
            ),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.people_outline),
                              label: const Text("Usuários")),
                          subtitle: Text(
                            '7',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.category),
                              label: const Text("Categorias")),
                          subtitle: Text(
                            '23',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.track_changes),
                              label: const Text("Produtos")),
                          subtitle: Text(
                            '120',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.tag_faces),
                              label: const Text("Vendas")),
                          subtitle: Text(
                            '13',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.shopping_cart),
                              label: const Text("Pedidos")),
                          subtitle: Text(
                            '5',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                          title: FlatButton.icon(
                              onPressed: null,
                              icon: const Icon(Icons.close),
                              label: const Text("Trocas")),
                          subtitle: Text(
                            '0',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: active, fontSize: 60.0),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      case Page.manage:
        return ListView(
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.add),
              title: const Text("Adicionar Produto"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdicionarProduto()));
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.change_history),
              title: const Text("Lista de Produtos"),
              onTap: () {},
            ),
          ],
        );
      default:
        return Container();
    }
  }
}