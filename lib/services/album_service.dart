import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:tintin/models/album.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';

class AlbumService {
  static Future<List<Album>> generateAlbums () async {
    return List<Album>.generate(10, (i) => Album(title: 'Titre $i', numero: i, year: 1930+i, yearInColor: 1970+i, image: 'images/image$i.jpg', resume: loremIpsum(words: 60)));
  }

  static Future<List<Album>> fetchAlbums() async {
    final String jsonString = await rootBundle.loadString('data/albums.json');

    final parsed = (jsonDecode(jsonString) as List).cast<Map<String, dynamic>>();

    return parsed.map<Album>((json) => Album.fromJson(json)).toList();
  }
}