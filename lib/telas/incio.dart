import 'package:appyoutube/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {

    Api api = Api();

    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            TextField(keyboardType: TextInputType.text,)
          ],
        )
      ),
    );
  }
}
