import 'package:flutter/material.dart';
import '../models/album.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;
  final bool isInReadingList;
  final Function(Album) onToggleReadingList;

  const AlbumDetails({
    required this.album,
    required this.isInReadingList,
    required this.onToggleReadingList,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Album Details'),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onToggleReadingList(album); // Appel de la fonction dans AlbumsMaster
          Navigator.pop(context); // Retour à l'écran précédent
        },
        child: Icon(isInReadingList ? Icons.remove : Icons.add), // Affichage de l'icône en fonction de l'état
      ),
    );
  }
}
