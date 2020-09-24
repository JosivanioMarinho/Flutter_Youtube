import 'package:MyYoutube/model/video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:async/async.dart';

const CHAVE_API = "AIzaSyDRFIYv4Z5JOUpKtBdlne0C6VQtHXVeKCI";
const CANAL_ID = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api{

  Future<List<Video>> pesquisar(String pesquisa) async{

    http.Response response = await http.get(
      URL_BASE + "search"
      "?part=snippet"
      "&type=video"
      "&maxResults=20"
      "&order=date"
      "&key=$CHAVE_API"
      "&channelId=$CANAL_ID"
      "&q=$pesquisa"
    );

    if( response.statusCode == 200 ){

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>(
        (map){
          return Video.fromJson(map);
        }
      ).toList();

      return videos;
      //print("resultado: " + dadosJson["items"][0]["snippet"].toString());
    }

  }

}