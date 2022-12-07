import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:rm_games/paginas/picture_page.dart';

class MinhaConta extends StatefulWidget {
  const MinhaConta({Key? key}) : super(key: key);

  @override
  State<MinhaConta> createState() => _MinhaContaState();
}

class _MinhaContaState extends State<MinhaConta> {
  List<CameraDescription> cameras = [];
  CameraController? controller;
  Size? size;

  final _firebaseAuth = FirebaseAuth.instance;
  String email = '';
  String uid = '';
  List<Reference> refs = [];
  String imagem_usuario = '';
  bool loading = true;

  @override
  // ignore: must_call_super
  void initState() {
    recebeUsuario();
    loadImages();
  }

  loadImages() async {
    refs = (await FirebaseStorage.instance.ref('images').listAll()).items;
    for (var ref in refs) {
      if (ref.fullPath == 'images/$uid.jpg') {
        imagem_usuario = await ref.getDownloadURL();
      }
      setState(() {
        loading = false;
      });
    }
  }

  recebeUsuario() async {
    User? usuario = _firebaseAuth.currentUser;
    if (usuario != null) {
      setState(() {
        email = usuario.email!;
        uid = usuario.uid;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Minha Conta'),
          centerTitle: true,
          elevation: 0,
        ),
        body: loading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: CircleAvatar(
                          radius: 75,
                          backgroundColor:
                              const Color.fromARGB(255, 7, 175, 180),
                          backgroundImage: imagem_usuario != ''
                              ? NetworkImage(imagem_usuario)
                              : const NetworkImage('')),
                    ),
                  ),
                  const ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Usuário Teste'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(email),
                  ),
                  ListTile(
                    leading: const Icon(Icons.camera_alt),
                    title: const Text('Alterar Foto'),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PicturePage())),
                  )
                ],
              ));
  }
}
