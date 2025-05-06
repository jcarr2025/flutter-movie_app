import '../common/MediaProvider.dart';
import '../common/util.dart';
class Cast{
  int id;
  String name;
  String pofilePath;
  factory Cast(Map jsonMap, MediaType mediaType) {
    try {
      return new Cast.deserialize(jsonMap, mediaType);
    }
    catch(ex){
      throw ex;
    }
  }
  Cast.deserialize(jsonMap, MediaType mediaType)
      : id = jsonMap['cast_id'].toInt(),
        name = jsonMap['name'] ?? "",
        pofilePath = jsonMap['profile_path'] ?? "";

}