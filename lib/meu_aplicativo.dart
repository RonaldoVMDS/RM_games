import 'package:flutter/material.dart';
import 'package:rm_games/login.dart';
import 'package:rm_games/paginas/tela_principal.dart';


class MeuAplicativo extends StatelessWidget {
  const MeuAplicativo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RM Games',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Login(),
      // home: const TelaPrincipal(),
    );
  }
}