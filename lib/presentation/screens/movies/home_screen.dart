import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neri_cinema/presentation/providers/movies/movies_providers.dart';
import 'package:neri_cinema/presentation/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    if (nowPlayingMovies.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return Column(
      children: [
        CustomAppbar(),
        MoviesSlideshow(movies: nowPlayingMovies),
      ],
    );
  }
}
