
import 'package:flutter/material.dart';
import 'package:movie/constants/strings.dart';
import 'package:movie/presentation/widghts/text.dart';
import 'package:movie/presentation/screens/top_rated_movies.dart';
import 'package:movie/presentation/screens/trending_movies%20.dart';
import 'package:movie/presentation/screens/tv_movie.dart';
import 'package:tmdb_api/tmdb_api.dart';


class HomeMoviePage extends StatefulWidget {
  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  List  moviemodels = [];
  List  topmovie = [];
  List  tv = [];
  @override
  void initState() {
   getAllMovies();
    super.initState();
  }
  getAllMovies()async{
    TMDB tmdb =TMDB(ApiKeys(APIKey,AccessToken),
        logConfig: ConfigLogger(showLogs: true,
            showErrorLogs: true));

    Map trandingresult = await tmdb.v3.trending.getTrending();
    Map topresult = await tmdb.v3.movies.getTopRated();
    Map tvresult = await tmdb.v3.tv.getPopular();

    setState(() {
      moviemodels = trandingresult['results'];
      topmovie  = topresult['results'];
      tv =  tvresult['results'];

    });
    print(moviemodels);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: modified_text(text: 'Flutter Movie App ❤'),
      ),
      body:ListView(
          children:  [
            TvMovie(tv: tv),
            TopTrendingMovies(toptrending: topmovie,),
            TrendingMovies(trending:moviemodels ,),

          ],
      )

    );
  }
}
