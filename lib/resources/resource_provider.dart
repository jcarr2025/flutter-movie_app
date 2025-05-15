import 'package:s15v189movie_app/common/MediaProvider.dart';

import '../model/Cast.dart';

abstract class ResourceProvider {
  Future<List<Cast>?> fetchCasts(int mediaId, MediaType mediaType);
}

abstract class CacheProvider{
  void AddCast(Cast cast);
}