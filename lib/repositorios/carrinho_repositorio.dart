//Verificar mais tarde se esse arquivo será usado
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:rm_games/componentes/produtos.dart';

class CarrinhoRepositorio extends ChangeNotifier {
  final List<Produto> _lista = [];

  UnmodifiableListView<Produto> get lista => UnmodifiableListView(_lista);

  saveAll(List<Produto> produtos) {
    for (var produto in produtos) {
      if (!_lista.contains(produto)) _lista.add(produto);
    }
    notifyListeners();
  }

  remove(Produto produto) {
    _lista.remove(produto);
    notifyListeners();
  }
}
