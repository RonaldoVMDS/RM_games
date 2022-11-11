// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rm_games/paginas/admin.dart';
import 'package:rm_games/servicos/auth_service.dart';

import '../database/DBFirestore.dart';
import '../servicos/auth_service.dart';

class AdicionarProduto extends StatefulWidget {
  const AdicionarProduto({Key? key}) : super(key: key);

  @override
  State<AdicionarProduto> createState() => _AdicionarProdutoState();
  // _AdminState createState() => _AdminState();
}

class _AdicionarProdutoState extends State<AdicionarProduto> {
  MaterialColor white = Colors.green;
  MaterialColor grey = Colors.grey;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomeProdutoController = TextEditingController();
  TextEditingController descricaoProdutoController = TextEditingController();
  TextEditingController categoriaProdutoController = TextEditingController();
  TextEditingController plataformaProdutoController = TextEditingController();
  TextEditingController dataProdutoController = TextEditingController();
  TextEditingController valorProdutoController = TextEditingController();
  late FirebaseFirestore db;
  late AuthService auth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: white,
        leading: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Admin()));
            },
            child: const Icon(
              Icons.close,
              color: Colors.white,
            )),
        title: const Text(
          "Adicionar Produto",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Row(children: [
              OutlinedButton(
                style: const ButtonStyle(alignment: Alignment.center),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(8.0, 30.0, 8.0, 30.0),
                  child: Icon(
                    Icons.add,
                    color: Colors.grey,
                  ),
                ),
              ),
            ]),
            const Text('Insira um Produto!',
                textAlign: TextAlign.center, style: TextStyle(fontSize: 24)),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: nomeProdutoController,
                decoration: const InputDecoration(hintText: 'Nome do Produto'),
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return 'Informe um nome para o Produto';
                  } else if (value.length < 5) {
                    return 'O nome do Produto deve ter no minimo 5 letras';
                  } else if (value.length > 20) {
                    return 'O nome do Produto deve ter no máximo 20 letras';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: descricaoProdutoController,
                decoration: const InputDecoration(hintText: 'Descrição'),
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return 'Informe uma descrição para o Produto';
                  } else if (value.length < 10) {
                    return 'A descrição do Produto deve ter no minimo 10 letras';
                  } else if (value.length > 50) {
                    return 'A descrição do Produto deve ter no máximo 50 letras';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: categoriaProdutoController,
                decoration: const InputDecoration(hintText: 'Categoria'),
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return 'Informe uma categoria para o Produto';
                  } else if (value.length < 2) {
                    return 'A categoria do Produto deve ter no minimo 2 letras';
                  } else if (value.length > 20) {
                    return 'A categoria do Produto deve ter no máximo 20 letras';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: plataformaProdutoController,
                decoration: const InputDecoration(hintText: 'Plataforma'),
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return 'Informe uma plataforma para o Produto';
                  } else if (value.length < 2) {
                    return 'A plataforma do Produto deve ter no minimo 2 letras';
                  } else if (value.length > 20) {
                    return 'A plataforma do Produto deve ter no máximo 20 letras';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: dataProdutoController,
                decoration:
                    const InputDecoration(hintText: 'Data de Lançamento'),
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return 'Informe a data de lançamento do Produto';
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: valorProdutoController,
                keyboardType: const TextInputType.numberWithOptions(),
                decoration: const InputDecoration(hintText: 'Valor do Produto'),
                validator: (value) {
                  if (value!.isEmpty || value == '') {
                    return 'Informe o valor do Produto';
                  }
                  return null;
                },
              ),
            ),
            FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Adicionar Produto'),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Item adicionado ao carrinho!",
                        textAlign: TextAlign.center,
                      ),
                      backgroundColor: Colors.green,
                    ));
                    db = DBFirestore.get();
                    await db
                        .collection('produtos')
                        .doc(nomeProdutoController.text)
                        .set({
                      'produto': nomeProdutoController.text,
                      'descricao': descricaoProdutoController.text,
                      'categoria': categoriaProdutoController.text,
                      'plataforma': plataformaProdutoController.text,
                      'lancamento': dataProdutoController.text,
                      'valor': valorProdutoController.text,
                      
                    });
                    nomeProdutoController.text = '';
                  descricaoProdutoController.text = ''; 
                  categoriaProdutoController.text = ''; 
                  plataformaProdutoController.text = ''; 
                  dataProdutoController.text = ''; 
                  valorProdutoController.text = ''; 
                  }
                })
          ],
        ),
      ),
    );
  }
}
