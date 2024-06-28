import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/reading_list_provider.dart';
import 'screens/albums_master.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ReadingListProvider(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Albums App',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.light,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          titleLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const AlbumsMaster(),
    );
  }
}
