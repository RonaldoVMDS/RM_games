// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';

class Produto {
  int prodID;
  String prodNome;
  List<String> prodFoto;
  double prodPreco;
  String prodCategoria;
  String prodLancamento;
  String prodPlataforma;
  String prodDescricao;
  Produto({
    required this.prodID,
    required this.prodNome,
    required this.prodFoto,
    required this.prodPreco,
    required this.prodCategoria,
    required this.prodLancamento,
    required this.prodPlataforma,
    required this.prodDescricao,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'prodID': prodID,
      'prodNome': prodNome,
      'prodFoto': prodFoto,
      'prodPreco': prodPreco,
      'prodCategoria': prodCategoria,
      'prodLancamento': prodLancamento,
      'prodPlataforma': prodPlataforma,
      'prodDescricao': prodDescricao,
    };
  }

  factory Produto.fromMap(Map<String, dynamic> map) {
    final original = map['screenshots'][0]['url'];
    const find = '//';
    const replaceWith = 'https://';
    final imga = original.replaceAll(find, replaceWith);
    final img = imga.replaceAll('t_thumb', 't_720p');
    final timestamp =
        DateTime.fromMillisecondsSinceEpoch(map['first_release_date'])
            .toString();
    final plataforma = map['platforms'][0]['name'].toString();
    final maximum = plataforma.length < 14 ? plataforma.length : 14;
    return Produto(
      prodID: map['id'] as int,
      prodNome: map['name'] as String,
      prodFoto: [img],
      prodPreco: (Random().nextInt(50) + 100).toDouble(),
      prodCategoria: map['genres'][0]['name'] as String,
      prodLancamento: timestamp.substring(0, 10),
      prodPlataforma: plataforma.substring(0, maximum),
      prodDescricao: map['summary'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Produto.fromJson(String source) =>
      Produto.fromMap(json.decode(source) as Map<String, dynamic>);
}
