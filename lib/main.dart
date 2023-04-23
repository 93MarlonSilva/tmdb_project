import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:tmdb_project/movies_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void _getListApi() {
    http.get(
      Uri.https('api.themoviedb.org', '/4/list/1'),
      headers: {
        'authorization':
            'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxMTNmYmFjMmNlYzFmYjcyMmMwMzA3MjczNjg3MzE5NSIsInN1YiI6IjYyZDBlNzViZmQ0YTk2MDA0ZmZkMzM4ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CUEMVm7IP-Sl3Mt2pL5qWtxCYnQBxMBaANzoGSWN3KI'
      },
    ).then(
      (Response value) {
        if (value.statusCode == 200) {
          MoviesList movies = MoviesList.fromJson(jsonDecode(value.body));
          print(movies.toString());
        }
        print('object');
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _getListApi();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueAccent,
        body: const Center(
          child: Text('Centro do app'),
        ),
      ),
    );
  }
}
