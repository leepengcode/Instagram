import 'package:demo_app_provider/model/movie_model.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  final MovieListModel movie;
  const MovieScreen({super.key, required this.movie});

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.id.toString()),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.movie.image.toString()),
                      fit: BoxFit.cover)),
            )
          ],
        ),
      )),
    );
  }
}
