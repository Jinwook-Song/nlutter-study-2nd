import 'package:flutter/material.dart';
import 'package:flutter_nomad_study_v2/assignment/movie/movie_api.dart';
import 'package:flutter_nomad_study_v2/assignment/movie/movie_card.dart';
import 'package:flutter_nomad_study_v2/assignment/movie/movie_model.dart';
import 'package:flutter_nomad_study_v2/contants/sizes.dart';

class MovieHomeScreen extends StatefulWidget {
  const MovieHomeScreen({super.key});

  @override
  State<MovieHomeScreen> createState() => _MovieHomeScreenState();
}

class _MovieHomeScreenState extends State<MovieHomeScreen> {
  late final Future<List<MovieModel>> popularMovies;
  late final Future<List<MovieModel>> nowPlayingMovies;
  late final Future<List<MovieModel>> comingSoonMovies;

  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  @override
  void initState() {
    super.initState();
    popularMovies = ApiService.getMovies(popular);
    nowPlayingMovies = ApiService.getMovies(nowPlaying);
    comingSoonMovies = ApiService.getMovies(comingSoon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size16),
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Popular Movies',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 24),
                  MovieCards(
                    movies: popularMovies,
                    aspectRatio: 16 / 9,
                    movieType: popular,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Now in Cinemas',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 24),
                  MovieCards(
                    movies: nowPlayingMovies,
                    aspectRatio: 1,
                    movieType: nowPlaying,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Comming soon',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  const SizedBox(height: 24),
                  MovieCards(
                    movies: comingSoonMovies,
                    aspectRatio: 1,
                    movieType: comingSoon,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
