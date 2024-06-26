import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/services/album_service.dart';

class AlbumsMaster extends StatelessWidget {
  const AlbumsMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Albums'),
          backgroundColor: Colors.blueGrey[600],
        ),
        backgroundColor: Colors.white,
        body: Container(
          child: FutureBuilder(
            future: AlbumService.generateAlbums(),
            builder: (context, snapshot) {
              List<Widget> children;
              if (snapshot.hasData) {
                List<Album>? data = snapshot.data;
                children = <Widget>[
                  ListView.builder(
                    itemCount: data?.length,
                    prototypeItem: const ListTile(
                      title: Text('Liste des albums'),
                    ),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(data![index].title),
                      );
                    },
                  )
                ];
              } else {
                children = const <Widget>[
                  Text('No data'),
                ];
              }
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: children,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
