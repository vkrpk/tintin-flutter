import 'package:flutter/material.dart';
import '../models/album.dart';
import '../services/album_service.dart';
import '../widgets/album_preview.dart';

class AlbumsMaster extends StatefulWidget {
  const AlbumsMaster({super.key});

  @override
  _AlbumsMasterState createState() => _AlbumsMasterState();
}

class _AlbumsMasterState extends State<AlbumsMaster> {
  final List<Album> _readingList = [];

  void toggleReadingList(Album album) {
    setState(() {
      if (_readingList.contains(album)) {
        _readingList.remove(album);
      } else {
        _readingList.add(album);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        backgroundColor: Colors.blueGrey[600],
      ),
      backgroundColor: Colors.white,
      body: FutureBuilder<List<Album>>(
        future: AlbumService.fetchAlbums(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Album>? data = snapshot.data;
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                return AlbumPreview(
                  album: data![index],
                  isInReadingList: _readingList.contains(data[index]),
                  onToggleReadingList: toggleReadingList,
                );
              },
            );
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}

