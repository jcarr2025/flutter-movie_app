import '../common/MediaProvider.dart';
import '../common/util.dart';

class Media {
  late int id;
  late double voteAverage;
  late String title;
  late String posterPath;
  late String backdropPath;
  late String overview;
  late String releaseDate;
  List<dynamic> genreIds;

  //String getPosterUrl()=> getMediumPictureUrl( posterPath);
  String getBackDropUrl() => getLargePictureUrl(backdropPath);

  String getGenres() => getGenreValues(genreIds);

  int getReleaseYear() {
    if (releaseDate == null || releaseDate == "") return 0;
    return DateTime.parse(releaseDate).year;
  }

  factory Media(Map jsonMap, MediaType mediaType) {
    try {
      return new Media.deserialize(jsonMap, mediaType);
    } catch (ex) {
      throw ex;
    }
  }

  Media.deserialize(jsonMap, MediaType mediaType)
      : id = jsonMap['id'].toInt(),
        voteAverage = jsonMap['vote_average'].toDouble(),
        title = jsonMap[ mediaType == MediaType.movie ? 'title':'name' ] ?? "",
        posterPath = jsonMap['poster_path'] ?? "",
        backdropPath = jsonMap['backdrop_path'] ?? "",
        overview = jsonMap['overview'],
        releaseDate = jsonMap[mediaType == MediaType.movie ? 'release_date' : 'first_air_date'],
        genreIds = jsonMap['genre_ids'].toList();
}


