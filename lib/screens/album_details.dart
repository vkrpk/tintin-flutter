import 'package:flutter/material.dart';

import '../models/album.dart';

class AlbumDetails extends StatelessWidget {
  const AlbumDetails({super.key, required this.album});

  final Album album;

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
                  backgroundImage: AssetImage(album.image),
                ),
                title: Text(album.title),
                subtitle: Text(album.resume),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Numéro : ${album.numero.toString()}'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text('Année de parution : ${album.year.toString()}'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
