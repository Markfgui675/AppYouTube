import 'package:appyoutube/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  TextEditingController _search = TextEditingController();

  _pesqui(){

    Api api = Api();
    api.pesquisar(_search.text);

  }


  @override
  Widget build(BuildContext context) {

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(32),
              child:
              TextField(keyboardType: TextInputType.text,
              controller: _search)
            ),
            Padding(padding: EdgeInsets.all(10),
              child: ElevatedButton(onPressed: _pesqui, child: Text('Pesquisar'))
            )
          ],
        )
      ),
    );
  }
}
