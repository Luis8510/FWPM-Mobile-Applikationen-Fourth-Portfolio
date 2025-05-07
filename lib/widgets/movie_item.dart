import 'package:flutter/material.dart';
import 'package:fourthportfolioexam/widgets/custom_image.dart';
import '../models/movie.dart';
import 'movie_details.dart';

class MovieItem extends StatelessWidget {
  final Movie movie;
  const MovieItem({super.key, required this.movie});

  Color _ratingColor(String rated) {
    switch (rated.toUpperCase()) {
      case 'G':
        return Colors.green.shade600;
      case 'PG':
        return Colors.lightGreen;
      case 'PG-13':
        return Colors.amber.shade700;
      case 'R':
        return Colors.red.shade700;
      case 'NC-17':
        return Colors.deepPurple;
      default:
        return Colors.grey;
    }
  }

  Widget _ratedBadge(String rated) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: _ratingColor(rated),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          rated,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetails(movie: movie),
              ));
        },
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
          child: Row(
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 230),
                child: CustomImage(
                    imageUrl: movie.posterUrl, width: 150, borderRadius: 8),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              movie.title,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(width: 6),
                          _ratedBadge(movie.rated),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text('Director: ${movie.director}'),
                      Text('Year: ${movie.year}'),
                      Text('Genre: ${movie.genre}'),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(Icons.access_time, size: 14),
                          const SizedBox(width: 4),
                          Text(movie.runtime),
                          const SizedBox(width: 12),
                          const Icon(Icons.star, size: 14, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(movie.imdbRating),
                        ],
                      ),
                      Text(
                        movie.plot,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
