import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

import '../screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  const AlbumPreview({super.key, required this.album});

  final Album album;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(album.title),
      leading: CircleAvatar(
        backgroundImage: AssetImage(album.image),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => AlbumDetails(album: album),
          ),
        );
      },
    );
  }
}
