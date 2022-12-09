import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:konfui_poc/publication/api.dart';
import 'package:konfui_poc/publication/models.dart';
import 'package:konfui_poc/publication/widgets.dart';
import 'package:logging/logging.dart';

import 'firebase_options.dart';

final _log = Logger('main');

void main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    log(record.message,
        time: record.time,
        level: record.level.value,
        name: record.loggerName,
        error: record.object);
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konfui',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: const MyHomePage(title: 'Publications'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List<Publication>> publications;

  @override
  void initState() {
    super.initState();
    publications = getPublications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PublicationList(publications: publications),
    );
  }
}
