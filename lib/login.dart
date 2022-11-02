import 'package:flutter/material.dart';
import 'package:rm_games/paginas/tela_principal.dart';

import 'paginas/cadastro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromRGBO(64, 164, 137, 1),
              Color.fromRGBO(192, 227, 220, 1)
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _pagina(),
      ),
    );
  }

  Widget _pagina() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _icone(),
              const SizedBox(height: 60),
              _campos("Usuário", usuarioController),
              const SizedBox(height: 30),
              _campos("Senha", senhaController, isPassword: true),
              const SizedBox(height: 60),
              _botaoLogin(),
              Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: TextButton(
                      child: const Text(
                        "Ainda não tem uma conta? Cadastre-se agora",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Cadastro()));
                      }))
            ],
          ),
        ),
      ),
    );
  }

  Widget _icone() {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: const Color.fromARGB(255, 0, 0, 0), width: 2),
          shape: BoxShape.circle),
      child: const Icon(
        Icons.person,
        color: Color.fromARGB(255, 0, 0, 0),
        size: 120,
      ),
    );
  }

  Widget _campos(String placeHolder, TextEditingController controller,
      {isPassword = false}) {
    var borda = OutlineInputBorder(
        borderRadius: BorderRadius.circular(9),
        borderSide: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)));
    return TextField(
      style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      controller: controller,
      decoration: InputDecoration(
        hintText: placeHolder,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
        enabledBorder: borda,
        focusedBorder: borda,
      ),
      obscureText: isPassword,
    );
  }

  Widget _botaoLogin() {
    return ElevatedButton(
      onPressed: () {
        var usuario = usuarioController.text;
        var senha = senhaController.text;
        if (usuario == 'Ronaldo' && senha == "123") {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const TelaPrincipal()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Usuário e/ou senha incorreto (os)!",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ));
        }
      },
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 0, 0, 0),
        onPrimary: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: const SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Entrar",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
          )),
    );
  }
}
