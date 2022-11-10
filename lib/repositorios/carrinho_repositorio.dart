//Verificar mais tarde se esse arquivo será usado
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:rm_games/models/produto.dart';

class CarrinhoRepositorio extends ChangeNotifier {
  final List<Produto> _lista = [];

  UnmodifiableListView<Produto> get lista => UnmodifiableListView(_lista);

  saveAll(Produto produto) {
      if (!_lista.contains(produto)) _lista.add(produto);
    notifyListeners();
  }

  remove(Produto produto) {
    _lista.remove(produto);
    notifyListeners();
  }
}
