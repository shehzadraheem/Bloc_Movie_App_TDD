import '../../../core/constants/constants.dart';
import '../../domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath
  });

  // Convert JSON into MovieModel
  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
        id: json[MovieKey.ID],
        title: json[MovieKey.TITLE],
        overview: json[MovieKey.OVERVIEW],
        posterPath: json[MovieKey.POSTER_PATH]
    );
  }

  // Convert MovieModel into JSON
  Map<String, dynamic> toJson(){
    return {
      MovieKey.ID: id,
      MovieKey.TITLE: title,
      MovieKey.OVERVIEW: overview,
      MovieKey.POSTER_PATH: posterPath,
    };
  }

  // Convert Movie toEntity
  Movie toEntity(){
    return Movie(
        id: id,
        title: title,
        overview: overview,
        posterPath: posterPath
    );
  }
}