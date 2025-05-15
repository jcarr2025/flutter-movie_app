import 'dart:async';
import 'package:s15v189movie_app/resources/api_provider.dart';
import 'package:s15v189movie_app/model/Cast.dart';
import 'package:s15v189movie_app/resources/repository.dart';

import '../model/Media.dart';
abstract class MediaProvider{
  Repository _repository= Repository.get();
  Future<List<Media>> fetchMedia( String category);
  Future<List<Cast>?> fetchCast( int mediaId);

}

class MovieProvider extends MediaProvider{
  ApiProvider _client = ApiProvider.get();
  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchMovies();
  }

  @override
  Future<List<Cast>?> fetchCast(int mediaId) {
    return _repository.fetchCast(mediaId,MediaType.movie);
  }

}


class ShowProvider extends MediaProvider{
  ApiProvider _client = ApiProvider.get();
  @override
  Future<List<Media>> fetchMedia(String category){
    return _client.fetchShow();

  }

  @override
  Future<List<Cast>?> fetchCast(int mediaId) {
    return _repository.fetchCast(mediaId,MediaType.show);
  }
}

enum MediaType { movie, show }
