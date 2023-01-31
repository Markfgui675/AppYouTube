import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        title: Text('Youtube', style: TextStyle(color: Colors.black),),
        actions: <Widget>[
          IconButton(onPressed: (){print('ação: videocam');}, icon: Icon(Icons.videocam, color: Colors.black)),
          IconButton(onPressed: (){print('ação: search');}, icon: Icon(Icons.search, color: Colors.black)),
          IconButton(onPressed: (){print('ação: account');}, icon: Icon(Icons.account_circle, color: Colors.black)),
        ],
        backgroundColor: Color(0xFFFFFFFF),

      ),

      body: Text(''),

    );
  }
}
