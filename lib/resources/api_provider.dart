import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:s15v189movie_app/common/Constants.dart';
import 'package:s15v189movie_app/model/Cast.dart';
import 'package:s15v189movie_app/resources/resource_provider.dart';
import 'dart:io';

import '../model/Media.dart';
import '../common/MediaProvider.dart';

class ApiProvider  implements ResourceProvider {
  static  final _apiProvider = new ApiProvider();
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = "es-ES";

   static ApiProvider get(){
     return _apiProvider;
   }


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

  Future<List<Media>> fetchMovies([String category ='popular']) async {  // Cambiado a Future<dynamic> (o usa un modelo específico)
    var uri =  new Uri.https( _baseUrl, '/3/movie/$category',
        {'language': _language, 'page':"1"});
    final data = await getJson(uri);
    return (data['results'] as List).map<Media>((item) => Media(item,MediaType.movie )).toList();
  }

  Future<List<Media>> fetchShow( [ String category = 'popular'] ) async {  // Cambiado a Future<dynamic> (o usa un modelo específico)
    var uri =  new Uri.https( _baseUrl, '/3/tv/$category',
        {'language': _language, 'page':"1"});
    final data = await getJson(uri);
    return (data['results'] as List).map<Media>((item) => Media(item, MediaType.show)).toList();
  }

  Future<List<Cast>> fetchCasts( int mediaId , MediaType mediaType) async {  // Cambiado a Future<dynamic> (o usa un modelo específico)
     final String endpoint=(mediaType==MediaType.movie)?'movie':'tv';
    print('${mediaId.toString()}Lectura de api tmdb  para movies'  );
    var uri =  new Uri.https( _baseUrl, '/3/$endpoint/$mediaId/credits',
        {'language': _language, 'page':"1"});
    final data = await getJson(uri);
    return (data['cast'] as List).map<Cast>((item) => Cast(item, MediaType.movie,mediaId)).toList();
  }

}
