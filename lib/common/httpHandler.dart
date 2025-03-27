import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:s15v189movie_app/common/Constants.dart';
import 'dart:io';

class HttpHandler {
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = "es-ES";
  //final _api_key = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhMmZiZjVlNTlmMGRlZjczNTE2MGYzZGQxZTY1NDU0NyIsIm5iZiI6MTc0MjgyNzczNC4zODEsInN1YiI6IjY3ZTE3MGQ2N2QwNTY1YWYwMjA3Zjc3YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.3illFbM5A_cEFrbODZw0HKlo9GZv30EHz0Io-q8qnHM';

  Future<dynamic> getJson(Uri uri) async {

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      return json.decode(response.body); // Devuelve un Map o List
    } else {

      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }


  Future<dynamic> fetchPopularMovies() async {
    final response = await http.get(
      Uri.parse(  'https://$_baseUrl/3/tv/popular?language=es-ES&page=1'  ),
      // Send authorization headers to the backend.
      headers: {HttpHeaders.authorizationHeader: 'Bearer $API_KEY'},
    );
    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body) as Map<String, dynamic>;
      return responseJson;
    } else {
      throw Exception("Failed to load data: ${response.statusCode}");
    }
  }

  Future<dynamic> fetchMoviesMalo() async {  // Cambiado a Future<dynamic> (o usa un modelo específico)
    final uri = Uri.https(_baseUrl, '/3/tv/on_the_air',{
      'api_key': API_KEY,
      'page': "1",

    });
    return await getJson(uri); // Devuelve el JSON parseado como objeto
  }
}
