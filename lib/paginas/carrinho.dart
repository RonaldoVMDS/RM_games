import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rm_games/repositorios/carrinho_repositorio.dart';

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
            IconButton(
              icon: const Icon(Icons.search),
              color: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
        body: Card(
          child: Consumer<CarrinhoRepositorio>(
              builder: (context, produtos, child) {
            return produtos.lista.isEmpty
                ? const ListTile(
                    leading: Icon(Icons.close_sharp),
                    title: Text('Ainda não há produtos no carrinho'),
                  )
                : ListView.builder(
                    itemCount: produtos.lista.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.network(produtos.lista[index].prodFoto[0],
                          width: 80,
                          height: 80,
                        ),
                        title: Text(produtos.lista[index].prodNome),
                        subtitle: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                //plataforma
                                const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Plataforma: ",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Text(
                                      produtos.lista[index].prodPlataforma,
                                      style: const TextStyle(fontSize: 12),
                                    )),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                const Padding(
                                  padding: EdgeInsets.all(0),
                                  child: Text(
                                    "Lançamento:",
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: Text(
                                      produtos.lista[index].prodLancamento,
                                      style: const TextStyle(fontSize: 12),
                                    )),
                              ],
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: Text(
                                  'R\$: ${produtos.lista[index].prodPreco}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 14, 133, 16))),
                            ),
                          ],
                        ),
                        trailing: InkWell(
                          onTap: () {
                            Provider.of<CarrinhoRepositorio>(context,
                                    listen: false)
                                .remove(produtos.lista[index]);
                          },
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(right: 30, top: 15),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
          }),
        ),
        bottomNavigationBar:
            Consumer<CarrinhoRepositorio>(builder: (context, produtos, child) {
          return produtos.lista.isEmpty
              ? const ListTile(
                  title: Text(''),
                )
              : Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: const Text("Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          subtitle: Text(
                              "R\$: ${produtos.somarTudo().toStringAsFixed(2)}",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 0, 255, 0))),
                        ),
                      ),
                      Expanded(
                        child: MaterialButton(
                          onPressed: () {},
                          color: const Color.fromARGB(255, 14, 133, 16),
                          child: const Text("Pagar",
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  ),
                );
        }));
  }
}
