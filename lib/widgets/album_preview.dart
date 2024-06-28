import 'package:flutter/material.dart';
import '../models/album.dart';
import '../screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;
  final bool isInReadingList;
  final Function(Album) onToggleReadingList;

  const AlbumPreview({
    required this.album,
    required this.isInReadingList,
    required this.onToggleReadingList,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        album.title,
        style: TextStyle(
          color: isInReadingList ? Colors.blue : Colors.black,
          fontWeight: isInReadingList ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: AssetImage(album.image),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AlbumDetails(
              album: album,
              isInReadingList: isInReadingList,
              onToggleReadingList: onToggleReadingList,
            ),
          ),
        );
      },
    );
  }
}
