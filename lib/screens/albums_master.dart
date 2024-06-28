import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/album.dart';
import '../services/album_service.dart';
import '../widgets/album_preview.dart';
import '../providers/reading_list_provider.dart';

class AlbumsMaster extends StatelessWidget {
  const AlbumsMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums'),
        // backgroundColor: Colors.blueGrey[600],
      ),
      // backgroundColor: Colors.white,
      body: FutureBuilder<List<Album>>(
        future: AlbumService.fetchAlbums(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            List<Album>? data = snapshot.data;
            return ListView.builder(
              itemCount: data?.length,
              itemBuilder: (context, index) {
                Album album = data![index];
                return Consumer<ReadingListProvider>(
                  builder: (context, readingListProvider, child) {
                    bool isInReadingList = readingListProvider.isInReadingList(album);
                    return AlbumPreview(
                      album: album,
                      isInReadingList: isInReadingList,
                      onToggleReadingList: (album) {
                        if (isInReadingList) {
                          readingListProvider.removeAlbum(album);
                        } else {
                          readingListProvider.addAlbum(album);
                        }
                      },
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return const Center(child: Text('No data'));
          }
        },
      ),
    );
  }
}
