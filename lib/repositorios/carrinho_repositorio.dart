//Verificar mais tarde se esse arquivo será usado
import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:rm_games/database/DBFirestore.dart';
import 'package:rm_games/models/produto.dart';
import 'package:rm_games/repositorios/produto_repositorio.dart';
import 'package:rm_games/servicos/auth_service.dart';

class CarrinhoRepositorio extends ChangeNotifier {
  final List<Produto> _lista = [];
  late FirebaseFirestore db;
  late AuthService auth;
  ProdutoRepositorio produtos;

  CarrinhoRepositorio({required this.auth, required this.produtos}) {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
    await _readFavoritas();
  }

  _startFirestore() {
    db = DBFirestore.get();
  }

  _readFavoritas() async {
    if (auth.usuario != null && _lista.isEmpty) {
      final snapshot =
          await db.collection('usuarios/${auth.usuario!.uid}/carrinho').get();
      for (var doc in snapshot.docs) {
        Produto produto = produtos.tabela
            .firstWhere((produto) => produto.prodNome == doc.get('produto'));
        _lista.add(produto);
        notifyListeners();
      }
    }
  }

  UnmodifiableListView<Produto> get lista => UnmodifiableListView(_lista);

  saveAll(Produto produto) async {
    if (!_lista.contains(produto)) _lista.add(produto);
    await db
        .collection('usuarios/${auth.usuario!.uid}/carrinho')
        .doc(produto.prodNome)
        .set({
      'produto': produto.prodNome,
      'descricao': produto.prodDescricao,
      'categoria': produto.prodCategoria,
      'plataforma': produto.prodPlataforma,
      'lancamento': produto.prodLancamento,
      'valor': produto.prodPreco,
      'imagem': produto.prodFoto
    });
    notifyListeners();
  }

  remove(Produto produto) async {
    await db
        .collection('usuarios/${auth.usuario!.uid}/carrinho')
        .doc(produto.prodNome)
        .delete();
    _lista.remove(produto);
    notifyListeners();
  }

  somarTudo() {
    double total = 0;
    if (!_lista.isNotEmpty) {
      return 0;
    }
    for (var produto in _lista) {
      total += produto.prodPreco;
    }
    return total;
  }
}
