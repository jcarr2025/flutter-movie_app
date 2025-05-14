import 'package:s15v189movie_app/model/Cast.dart';
import 'package:s15v189movie_app/resources/db_provider.dart';
import 'package:s15v189movie_app/resources/api_provider.dart';

class Repository {
  static final Repository _repository = new Repository();
  ApiProvider _apiProvider= ApiProvider.get();
  DBProvider _dbProvider= DBProvider.get();

  static Repository get(){
    return _repository;

  }

   Future<List<Cast>?> fetchCastMovies(int mediaId) async {
     List<Cast>? list=await _dbProvider.fecthCasts(mediaId);
     if(list!=null){
        return list;
     }
     list = await _apiProvider.fetchCreditsMovie(mediaId);
     list.forEach((element)=> _dbProvider.AddCast(element) );
    return list;
  }

  Future<List<Cast>?> fetchCastShows(int mediaId) async {
    List<Cast>? list=await _dbProvider.fecthCasts(mediaId);
    if(list!=null){
      return list;
    }
    list = await _apiProvider.fetchCreditsShows(mediaId);
    list.forEach((element)=> _dbProvider.AddCast(element) );
    return list;
  }

}
