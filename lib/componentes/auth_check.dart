import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rm_games/paginas/login.dart';
import 'package:rm_games/paginas/tela_principal.dart';
import 'package:rm_games/servicos/auth_service.dart';

class AuthCheck extends StatefulWidget {
  const AuthCheck({super.key});

  @override
  State<AuthCheck> createState() => _AuthCheckState();
}

class _AuthCheckState extends State<AuthCheck> {
  @override
  Widget build(BuildContext context) {
    AuthService auth = Provider.of<AuthService>(context);
    if (auth.isLoading) {
      return loading();
    } else if (auth.usuario == null) {
      return const Login();
    } else {
      return const TelaPrincipal();
    }
  }

  loading() {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
