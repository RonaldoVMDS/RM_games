import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:rm_games/models/produto.dart';
import 'package:http/http.dart' as http;

class ProdutoRepositorio extends ChangeNotifier {
  List<Produto> _tabela = [];

  List<Produto> get tabela => _tabela;

  ProdutoRepositorio() {
    _setupProdutosTable();
  }

  _setupProdutosTable() async {
    String uri = 'https://api.igdb.com/v4/games';

    final response = await http.post(
      Uri.parse(uri),
      headers: {
        "Content-Type": "application/json",
        "Client-ID": "cz2t464vrxlczxgvbj2dojxu1y8ola",
        "Authorization": "Bearer 7h1req6n293zk1whovw3b1ileetjch",
      },
      body:
          'fields screenshots.url, name, summary, platforms.name, genres.name, first_release_date; where screenshots.url != null; limit 15;where summary != null;where genres.name != null;where platforms.name != null;where first_release_date != null;',
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      final List<dynamic> produtos = json;
      return _tabela =
          produtos.map<Produto>((resp) => Produto.fromMap(resp)).toList();
    }
    notifyListeners();
  }
}
