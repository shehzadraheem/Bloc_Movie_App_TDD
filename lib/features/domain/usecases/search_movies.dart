import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../entities/movie.dart';
import '../repositories/movie_repository.dart';


class SearchMovies{
  final MovieRepository repository;

  SearchMovies(this.repository);

  Future<Either<Failure, List<Movie>>> call(String query) async {
    return await repository.searchMovies(query);
  }
}