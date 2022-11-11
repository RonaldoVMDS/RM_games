import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rm_games/meu_aplicativo.dart';
import 'package:rm_games/repositorios/carrinho_repositorio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:rm_games/servicos/auth_service.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => CarrinhoRepositorio(
          auth: context.read<AuthService>(),
        )),
    ], 
  child: const MeuAplicativo()));
}
