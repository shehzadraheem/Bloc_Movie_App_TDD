import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../entities/movie.dart';

abstract class MovieRepository{
  Future<Either<Failure,List<Movie>>> getTrendingMovies();
  Future<Either<Failure,List<Movie>>> searchMovies(String query);
  Future<Either<Failure,List<Movie>>> getPopularMovies();
}