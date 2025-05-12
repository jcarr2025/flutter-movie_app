import 'dart:async';
import 'package:s15v189movie_app/resources/httpHandler.dart';
import 'package:s15v189movie_app/model/Cast.dart';

import '../model/Media.dart';
abstract class MediaProvider{
  Future<List<Media>> fetchMedia( String category);
  Future<List<Cast>> fetchCast( int mediaId);

}

class MovieProvider extends MediaProvider{
  ApiProvider _client = ApiProvider.get();
  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies();
  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditsMovie(mediaId);
  }

}


class ShowProvider extends MediaProvider{
  ApiProvider _client = ApiProvider.get();
  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow();

  }

  @override
  Future<List<Cast>> fetchCast(int mediaId) {
    return _client.fetchCreditsShows(mediaId);
  }
}

enum MediaType { movie, show }
