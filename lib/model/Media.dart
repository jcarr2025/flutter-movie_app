class Media{
  late int id;
  late double voteAverage;
  late String title;
  late String posterPath;
  late String backdropPath;
  late String overview;
  late String releaseDate;
  List<dynamic> genreId;
  factory Media(Map jsonMap){
    return new Media(jsonMap);

  }
  Media.deserialize(jsonMap):
      id = jsonMap['id'].toInt(),
      voteAverage = jsonMap['vote_average'].toDouble(),
      title = jsonMap['title'],
      posterPath = jsonMap['poster_path']??"",
      backdropPath = jsonMap['backdrop_path']??"",
      overview = jsonMap['overview'],
      releaseDate = jsonMap['release_date'],
      genreId = jsonMap['genre_ids'].toList();


}