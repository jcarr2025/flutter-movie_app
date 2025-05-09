import '../common/MediaProvider.dart';
import '../common/util.dart';
class Cast{
  int id;
  String name;
  String pofilePath;
  String getCastUrl()=> getMediumPictureUrl( pofilePath);

  factory Cast(Map jsonMap, MediaType mediaType) {
    try {
      return new Cast.deserialize(jsonMap, mediaType);
    }
    catch(ex){
      throw ex;
    }
  }
  Cast.deserialize(jsonMap, MediaType mediaType)
      :
        id = mediaType==MediaType.movie? jsonMap['cast_id'].toInt(): jsonMap['id'].toInt(),
        name = jsonMap['name'] ?? "",
        pofilePath = jsonMap['profile_path'] ?? "";

  Cast.fromDB( Map<String, dynamic> parsedJson):
        id = parsedJson['id'].toInt(),
        name = parsedJson['name'].toString(),
        pofilePath = parsedJson['profile_path'];
}