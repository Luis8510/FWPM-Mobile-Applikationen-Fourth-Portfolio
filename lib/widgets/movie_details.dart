import 'package:flutter/material.dart';
import 'package:fourthportfolioexam/widgets/custom_image.dart';

import '../models/movie.dart';

class MovieDetails extends StatelessWidget {
  final Movie movie;
  const MovieDetails({super.key, required this.movie});

  Widget _sectionTitle(String text) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CustomImage(
                  imageUrl: movie.posterUrl,
                  width: 200,
                  height: 300,
                  borderRadius: 12),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    movie.title,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade800,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(movie.rated,
                      style: const TextStyle(color: Colors.white)),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(children: [
              const Icon(Icons.calendar_today, size: 16),
              const SizedBox(width: 4),
              Text(movie.released),
              const SizedBox(width: 16),
              const Icon(Icons.access_time, size: 16),
              const SizedBox(width: 4),
              Text(movie.runtime),
            ]),
            const SizedBox(height: 12),
            _sectionTitle('Details'),
            Row(
              children: [
                const Icon(Icons.category, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text(movie.genre)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.person, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text('Director: ${movie.director}')),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.edit, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text('Writer: ${movie.writer}')),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.group, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text('Actors: ${movie.actors}')),
              ],
            ),
            _sectionTitle('Plot'),
            Text(movie.plot),
            _sectionTitle('Weitere Infos'),
            Row(
              children: [
                const Icon(Icons.emoji_events, size: 16),
                const SizedBox(width: 6),
                Expanded(child: Text(movie.awards)),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.language, size: 16),
                const SizedBox(width: 6),
                Text(movie.language),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(Icons.flag, size: 16),
                const SizedBox(width: 6),
                Text(movie.country),
              ],
            ),
            _sectionTitle('Bewertungen'),
            Row(
              children: [
                const Icon(Icons.score, size: 16),
                const SizedBox(width: 6),
                Text('Metascore: ${movie.metascore}'),
                const SizedBox(width: 16),
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 6),
                Text('${movie.imdbRating} (${movie.imdbVotes})'),
              ],
            ),
            if (movie.images.isNotEmpty) ...[
              _sectionTitle('Galerie'),
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: movie.images.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, i) => CustomImage(
                    imageUrl: movie.images[i],
                    width: 200,
                    borderRadius: 8,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
