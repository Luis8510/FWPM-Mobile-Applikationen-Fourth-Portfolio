class Movie {
  final String title;
  final String year;
  final String rated;
  final String released;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actors;
  final String plot;
  final String language;
  final String country;
  final String awards;
  final String posterUrl;
  final String metascore;
  final String imdbRating;
  final String imdbVotes;
  final String type;
  final List<String> images;

  const Movie({
    required this.title,
    required this.year,
    required this.rated,
    required this.released,
    required this.runtime,
    required this.genre,
    required this.director,
    required this.writer,
    required this.actors,
    required this.plot,
    required this.language,
    required this.country,
    required this.awards,
    required this.posterUrl,
    required this.metascore,
    required this.imdbRating,
    required this.imdbVotes,
    required this.type,
    required this.images,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] as String? ?? 'Unknown',
      year: json['Year'] as String? ?? '-',
      rated: json['Rated'] as String? ?? '-',
      released: json['Released'] as String? ?? '-',
      runtime: json['Runtime'] as String? ?? '-',
      genre: json['Genre'] as String? ?? '-',
      director: json['Director'] as String? ?? '-',
      writer: json['Writer'] as String? ?? '-',
      actors: json['Actors'] as String? ?? '-',
      plot: json['Plot'] as String? ?? '-',
      language: json['Language'] as String? ?? '-',
      country: json['Country'] as String? ?? '-',
      awards: json['Awards'] as String? ?? '-',
      posterUrl: json['Poster'] as String? ?? '',
      metascore: json['Metascore'] as String? ?? '-',
      imdbRating: json['imdbRating'] as String? ?? '-',
      imdbVotes: json['imdbVotes'] as String? ?? '-',
      type: json['Type'] as String? ?? '-',
      images: (json['Images'] as List?)?.map((e) => e as String).toList() ??
          const [],
    );
  }
}
