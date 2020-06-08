import 'package:cmoney/photos.dart';

class PhotosList{
  List<Photos> photoslist;

  PhotosList.fromJson(List<dynamic> json)
      :photoslist = json.map((i) => Photos.fromJson(i)).toList();


  @override
  String toString() {
    return 'BasicList: $photoslist';
  }
}