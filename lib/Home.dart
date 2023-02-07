import 'package:appyoutube/telas/biblioteca.dart';
import 'package:appyoutube/telas/emalta.dart';
import 'package:appyoutube/telas/incio.dart';
import 'package:appyoutube/telas/inscricoes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indice = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca()
    ];

    return Scaffold(

      appBar: AppBar(

        iconTheme: IconThemeData(
          color: Colors.black,
          opacity: 0.75,
        ),
        title: Image.asset('imagens/youtube.png', width: 110,),
        actions: <Widget>[
          IconButton(onPressed: (){print('ação: videocam');}, icon: Icon(Icons.videocam, color: Colors.black)),
          IconButton(onPressed: (){print('ação: search');}, icon: Icon(Icons.search, color: Colors.black)),
          IconButton(onPressed: (){print('ação: account');}, icon: Icon(Icons.account_circle, color: Colors.black)),
        ],
        backgroundColor: Color(0xFFFFFFFF),

      ),

      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indice],
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,
        onTap: (indice){
          setState(() {
            _indice = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Início'),
          BottomNavigationBarItem(icon: Icon(Icons.whatshot), label: 'Em alta'),
          BottomNavigationBarItem(icon: Icon(Icons.subscriptions), label: 'Inscrições'),
          BottomNavigationBarItem(icon: Icon(Icons.folder), label: 'Biblioteca'),
        ],
      ),

    );
  }
}
