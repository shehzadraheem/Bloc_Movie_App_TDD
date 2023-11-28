import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'features/data/datasources/movie_remote_data_source.dart';
import 'features/data/datasources/remote/movie_remote_data_source_impl.dart';
import 'features/data/repositories/movie_repository_impl.dart';
import 'features/domain/repositories/movie_repository.dart';
import 'features/domain/usecases/get_popular_movies.dart';
import 'features/domain/usecases/get_trending_movies.dart';
import 'features/domain/usecases/search_movies.dart';
import 'features/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'features/presentation/bloc/search_movies/search_movies_bloc.dart';
import 'features/presentation/bloc/trending_movies/trending_movies_bloc.dart';

final getIt = GetIt.instance;

void init() {
  // Bloc
  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));

  // Use cases
  getIt.registerLazySingleton(() => GetPopularMovies(getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(getIt()));
  getIt.registerLazySingleton(() => SearchMovies(getIt()));

  // Repositories
  getIt.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(remoteDataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl(client: getIt()));

  // Http service
  getIt.registerLazySingleton(() => http.Client());

}