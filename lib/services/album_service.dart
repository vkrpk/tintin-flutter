import 'package:tintin/models/album.dart';

class AlbumService {
  static Future<List<Album>> generateAlbums () async {
    return List<Album>.generate(10, (i) => Album('Titre $i', i, 1930+i, 1930+i, 'images/image$i.jpg', 'résumé$i'));
  }
}