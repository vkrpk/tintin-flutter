import 'package:flutter/material.dart';
import '../models/album.dart';

class ReadingListProvider with ChangeNotifier {
  final List<Album> _albums = [];

  List<Album> get albums => _albums;

  void addAlbum(Album album) {
    if (!_albums.contains(album)) {
      _albums.add(album);
      notifyListeners();
    }
  }

  void removeAlbum(Album album) {
    if (_albums.contains(album)) {
      _albums.remove(album);
      notifyListeners();
    }
  }

  bool isInReadingList(Album album) {
    return _albums.contains(album);
  }
}
