import 'package:flutter/material.dart';
import 'package:rm_games/login.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({Key? key}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  TextEditingController usuarioController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController repitaSenhaController = TextEditingController();
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
              const SizedBox(
                height: 40,
                child: Text(
                  "Crie sua conta",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              const SizedBox(height: 20),
              _campos("Usuário", usuarioController),
              const SizedBox(height: 20),
              _campos("E-mail", emailController),
              const SizedBox(height: 20),
              _campos("Senha", senhaController, isPassword: true),
              const SizedBox(height: 20),
              _campos("Repita a senha", repitaSenhaController,
                  isPassword: true),
              const SizedBox(height: 20),
              _botaoCadastrar(),
              Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: TextButton(
                      child: const Text(
                        "Voltar ao Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()));
                      }))
            ],
          ),
        ),
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

  Widget _botaoCadastrar() {
    return ElevatedButton(
      onPressed: () {
        var usuario = usuarioController.text;
        var email = emailController.text;
        var senha = senhaController.text;
        var repitaSenha = repitaSenhaController.text;

        if (usuario == '' || email == '' || senha == '' || repitaSenha == '') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Favor preencher todos os campos!",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ));
        } else if (senha != repitaSenha) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "As senhas devem ser iguais!",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.red,
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text(
              "Cadastro efetuado com sucesso!",
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green,
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
              "Cadastrar",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 32),
            ),
          )),
    );
  }
}
