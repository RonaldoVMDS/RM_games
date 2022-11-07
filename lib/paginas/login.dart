import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rm_games/servicos/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController senha = TextEditingController();
  bool isLogin = true;
  late String titulo;
  late String actionButton;
  late String toggleButton;
  bool loading = false;

  @override
  void initState() {
    super.initState();
    setFormAction(true);
  }

  setFormAction(bool acao) {
    setState(() {
      isLogin = acao;
      if (isLogin) {
        titulo = "Entrar na minha conta";
        actionButton = 'Entrar';
        toggleButton = 'Não tem uma conta? Ir para cadastro';
      } else {
        titulo = "Crie sua conta";
        actionButton = 'Cadastrar';
        toggleButton = 'Já tenho uma conta';
      }
    });
  }

  entrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().login(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  registrar() async {
    setState(() => loading = true);
    try {
      await context.read<AuthService>().registrar(email.text, senha.text);
    } on AuthException catch (e) {
      setState(() => loading = false);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/fundo_login_registro.png"),
              opacity: 0.6,
              fit: BoxFit.fill,
            ),
          ),
        ),
        _pagina(),
      ]),
    );
  }

  Widget _pagina() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      titulo,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        letterSpacing: -1.3,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: TextFormField(
                    controller: email,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe o e-mail corretamente';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                  child: TextFormField(
                    controller: senha,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Informe uma senha';
                      } else if (value.length < 6) {
                        return 'A senha deve ter no mínimo 6 caracteres';
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        if (isLogin) {
                          entrar();
                        } else {
                          registrar();
                        }
                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Icon(Icons.check),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            actionButton,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ),
                        // ignore: prefer_const_constructors
                      ],
                    ),
                  ),
                ),
                TextButton(
                    child: Text(
                      toggleButton,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 0, 255, 42), fontSize: 14),
                    ),
                    onPressed: () => setFormAction(!isLogin))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
