import '../common/MediaProvider.dart';
import '../common/util.dart';
class Cast{
  int id;
  String name;
  String profilePath;
  int mediaId;
  String getCastUrl()=> getMediumPictureUrl( profilePath);

  factory Cast(Map jsonMap, MediaType mediaType, int mediaId) {
    try {
      print( "antes de deserailize");
      return new Cast.deserialize(jsonMap, mediaType, mediaId);
    }
    catch(ex){
      throw ex;
    }
  }
  Cast.deserialize(jsonMap, MediaType mediaType, int mediaId)
      :
        id = jsonMap['id'].toInt(),
        name = jsonMap['name'] ?? "",
        profilePath = jsonMap['profile_path'] ?? "",
        mediaId = mediaId;

  Cast.fromDB( Map<String, dynamic> parsedJson):
        id = parsedJson['id'].toInt(),
        name = parsedJson['name'].toString(),
        profilePath = parsedJson['profile_path'],
        mediaId = parsedJson['media_id'].toInt();


  Map<String,dynamic> toMap(){
    return <String,dynamic> {
      'id': id,
      'name': name,
      'profile_path': profilePath,
      'media_id': mediaId
    };
  }
}