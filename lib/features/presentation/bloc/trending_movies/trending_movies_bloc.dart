import 'package:bloc_tdd/features/presentation/bloc/trending_movies/trending_movies_event.dart';
import 'package:bloc_tdd/features/presentation/bloc/trending_movies/trending_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_trending_movies.dart';

class TrendingMoviesBloc extends Bloc<TrendingMoviesEvent, TrendingMoviesState>{
  final GetTrendingMovies getTrendingMovies;

  TrendingMoviesBloc({required this.getTrendingMovies}) : super(TrendingMoviesInitial()) {
    on<FetchTrendingMovies>((event, emit) async {
      emit(TrendingMoviesLoading());
      final failureOrMovies = await getTrendingMovies();
      failureOrMovies.fold(
              (failure) => emit(TrendingMoviesError(failure.toString())),
              (movies) => emit(TrendingMoviesLoaded(movies)));
    });
  }
}