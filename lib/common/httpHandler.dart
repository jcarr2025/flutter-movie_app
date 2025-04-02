import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:s15v189movie_app/common/Constants.dart';
import 'dart:io';

import '../model/Media.dart';

class HttpHandler {
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = "es-ES";




  Future<List< Media>> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse(  'https://$_baseUrl/3/tv/popular?language=es-ES&page=1'  ),
      // Send authorization headers to the backend.
      //headers: {HttpHeaders.authorizationHeader: 'Bearer $API_KEY'},
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body) as Future<List<Media>>;
      return responseJson;
    } else {
      throw Exception("error al consultar data: ${response.statusCode}");
    }

  }



  Future<dynamic> getJson(Uri uri) async {
    http.Response response = await http.get(uri, headers: {HttpHeaders.authorizationHeader: 'Bearer $API_KEY'});
    return json.decode(response.body); // Devuelve un Map o List
  }

  Future<List<Media>> fetchMovies() async {  // Cambiado a Future<dynamic> (o usa un modelo específico)
    var uri =  new Uri.https( _baseUrl, '/3/tv/popular',
        {'language': _language, 'page':"1"});
    return await getJson(uri).then ( ( ( data)=>data['results'].map<Media>((item)=>new Media(item)).toList()   )); // Devuelve el JSON parseado como objeto
  }
}
