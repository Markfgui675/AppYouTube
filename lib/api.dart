import 'package:appyoutube/%20model/Video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const CHAVE_YOUTUBE_API = 'AIzaSyCLvN5IIj73A2-QZ54eknUG8Qv9Re2LE3s';
const URL_BASE = 'https://www.googleapis.com/youtube/v3/';

class Api {

  Future<List<Video>?> pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + 'search'
          "?part=snippet"
          "&type=video"
          "&maxResults=20"
          "&order=date"
          "&key=$CHAVE_YOUTUBE_API"
          "&q=$pesquisa"
    );

    if(response.statusCode == 200){
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson['items'].map<Video>(
          (map){
            return Video.fromJson(map);
            //return Video.converterJson(map);
          }
      ).toList();

      /*
      for(var video in videos){
        print("id: ${video.id}");
        print(video.canal);
        print(video.imagem);
        print(video.titulo);
      }
       */

      return videos;

      /*
      for(var video in dadosJson['items']){
        print('Resultado: ' + video.toString());
      }
      */

      

      //print(dadosJson['items'][0]['snippet']['title'].toString());
    } else{

    }

  }

}