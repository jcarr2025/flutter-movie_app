import '../common/util.dart';

class Media{
   late int id;
   late double voteAverage;
   late String title;
   late String posterPath;
   late String backdropPath;
   late String overview;
   late String releaseDate;
  List<dynamic> genreIds;

  //String getPosterUrl()=> getMediumPictureUrl( posterPath);
  String getBackDropUrl()=> getLargePictureUrl( backdropPath);

  factory Media(Map jsonMap){
    try {
      return new Media.deserialize(jsonMap);
    }
    catch (ex) {
      throw ex;
    }

  }
  Media.deserialize(jsonMap):
      id = jsonMap['id'].toInt(),
      voteAverage = jsonMap['vote_average'].toDouble(),
      title = jsonMap['name']??"",
      posterPath = jsonMap['poster_path']??"",
      backdropPath = jsonMap['backdrop_path']??"",
      overview = jsonMap['overview'],
      releaseDate = jsonMap['release_date'],
      genreIds = jsonMap['genre_ids'].toList();


}