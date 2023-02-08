import 'dart:convert';

import 'package:appyoutube/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ model/Video.dart';

class Inicio extends StatefulWidget {
  String pesquisa;

  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {


  _listarVideos(String p){

    Future<List<Video>?> videos;

    Api api = Api();
    videos = api.pesquisar(p);

    return videos;
  }


  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Video>>(
        future: _listarVideos(widget.pesquisa),
        builder: (context, snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if(snapshot.hasData){
                return ListView.separated(itemBuilder: (context, index){
                  List<Video> videos = snapshot.data!;
                  Video video = videos[ index ];
                  return Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(video.imagem!), fit: BoxFit.cover)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                              ListTile(
                                title: Text(video.titulo.toString()),
                                subtitle: Text(video.canal.toString()),
                              ),
                          ],
                        )
                      ),
                    ],
                  );
                },
                    separatorBuilder: (context, index) => Divider(
                      height: 16,
                      color: Colors.white,
                    ),
                    itemCount: snapshot.data!.length);
              } else {
                return Center(
                  child: Text("Nenhum dado a ser exibido!"),
                );
              }
              break;
          }
        },
    );
  }
}
