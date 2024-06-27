import 'package:flutter/material.dart';
import '../models/album.dart';

class AlbumDetails extends StatefulWidget {
  final Album album;

  const AlbumDetails({super.key, required this.album});

  @override
  _AlbumDetailsState createState() => _AlbumDetailsState();
}

class _AlbumDetailsState extends State<AlbumDetails> {
  final Set<Album> listAlbums = {};

  void toggleAlbum() {
    setState(() {
      if (listAlbums.contains(widget.album)) {
        listAlbums.remove(widget.album);
      } else {
        listAlbums.add(widget.album);
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
      body: Center(
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(widget.album.image),
                ),
                title: Text(widget.album.title),
                subtitle: Text(widget.album.resume),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Numéro : ${widget.album.numero.toString()}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Année de parution : ${widget.album.year.toString()}'),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.large(
        onPressed: toggleAlbum,
        child: Icon(listAlbums.contains(widget.album) ? Icons.remove : Icons.add),
      ),
    );
  }
}
