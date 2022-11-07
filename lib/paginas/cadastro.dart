// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:rm_games/paginas/login.dart';
// import 'package:rm_games/servicos/auth_service.dart';

// class Cadastro extends StatefulWidget {
//   const Cadastro({Key? key}) : super(key: key);

//   @override
//   State<Cadastro> createState() => _CadastroState();
// }

// class _CadastroState extends State<Cadastro> {
//   final formKey = GlobalKey<FormState>();
//   // TextEditingController usuario = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController senha = TextEditingController();

//   bool loading = false;

//   registrar() async {
//     setState(() => loading = true);
//     try {
//       await context.read<AuthService>().registrar(email.text, senha.text);
//     } on AuthException catch (e) {
//       setState(() => loading = false);
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(e.message)));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(children: <Widget>[
//         Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("images/fundo_login_registro.png"),
//               opacity: 0.6,
//               fit: BoxFit.fill,
//             ),
//           ),
//         ),
//         _pagina(),
//       ]),
//     );
//   }

//   Widget _pagina() {
//     return Padding(
//       padding: const EdgeInsets.all(40.0),
//       child: Center(
//         child: SingleChildScrollView(
//           child: Form(
//             key: formKey,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const SizedBox(
//                   height: 40,
//                   child: Text(
//                     "Crie sua conta",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(22),
//                   child: TextFormField(
//                     controller: email,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Email',
//                     ),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Informe o e-mail corretamente';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
//                   child: TextFormField(
//                     controller: senha,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Senha',
//                     ),
//                     validator: (value) {
//                       if (value!.isEmpty) {
//                         return 'Informe uma senha';
//                       } else if (value.length < 6) {
//                         return 'A senha deve ter no mínimo 6 caracteres';
//                       } else {
//                         return null;
//                       }
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(22),
//                   child: ElevatedButton(
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         registrar();
//                       }
//                     },
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: 
//                         (loading) ? [
//                           const Padding(padding: EdgeInsets.all(16),
//                           child: SizedBox(
//                             width: 24,
//                             height: 24,
//                             child: CircularProgressIndicator(
//                               color: Colors.white,
//                             ),
//                           ),)
//                         ]
//                         : [
//                         const Icon(Icons.check),
//                         const Padding(
//                           padding: EdgeInsets.all(16),
//                           child: Text(
//                             "Cadastrar",
//                             style: TextStyle(fontSize: 20),
//                           ),
//                         ),
//                         // ignore: prefer_const_constructors
//                       ],
//                     ),
//                   ),
//                 ),
//                 TextButton(
//                     child: const Text(
//                       "Já tem uma conta? Entrar",
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           color: Color.fromARGB(255, 0, 255, 42), fontSize: 14),
//                     ),
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => const Login()),
//                       );
//                     })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
