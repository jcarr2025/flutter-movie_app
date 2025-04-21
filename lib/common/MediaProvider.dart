import 'dart:async';
import '../model/Media.dart';
abstract class MediaProvider{
  Future<List<Media>> fetchMedia();

}