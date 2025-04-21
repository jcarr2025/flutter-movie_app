import 'dart:async';
import 'package:s15v189movie_app/common/httpHandler.dart';

import '../model/Media.dart';
abstract class MediaProvider{
  Future<List<Media>> fetchMedia();

}

class MovieProvider extends MediaProvider{
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(){
    return _client.fetchMovies();
  }

}


class ShowProvider extends MediaProvider{

}

