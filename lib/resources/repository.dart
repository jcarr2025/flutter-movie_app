import 'package:s15v189movie_app/model/Cast.dart';
import 'package:s15v189movie_app/resources/db_provider.dart';
import 'package:s15v189movie_app/resources/api_provider.dart';
import 'package:s15v189movie_app/resources/resource_provider.dart';

import '../common/MediaProvider.dart';

class Repository {
  static final Repository _repository = new Repository();

  List<ResourceProvider> _providers = <ResourceProvider> [dbProvider,apiProvider];
  List<CacheProvider> caches = <CacheProvider> [dbProvider];
  static Repository get(){
    return _repository;

  }

   Future<List<Cast>?> fetchCast(int mediaId,MediaType mediaType) async {
    var provider;
    List <Cast>? list;
    for (var provider in _providers) {
      list = await provider.fetchCasts(mediaId, mediaType);
      if(list!=null){
        break;
      }
    }
    for(var cache in caches){
      if(cache!=provider){
        list?.forEach((element) => cache.AddCast(element));
      }
    }
    return list;


  }

  // Future<List<Cast>?> fetchCastShows(int mediaId) async {
  //   List<Cast>? list=await _dbProvider.fecthCasts(mediaId);
  //   if(list!=null){
  //     return list;
  //   }
  //   list = await _apiProvider.fetchCreditsShows(mediaId);
  //   list.forEach((element)=> _dbProvider.AddCast(element) );
  //   return list;
  // }

}
