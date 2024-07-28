import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieHorizontalListview extends StatelessWidget {
  final List<Movie> movies;
  final String? title;
  final String? subtitle;
  final VoidCallbackAction? loadNextPage;

  const MovieHorizontalListview({
    super.key,
    required this.movies,
    this.title,
    this.subtitle,
    this.loadNextPage,
  });

  @override
  
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350,
      child: Column(
        children: [
          
          _Title(title: title, subtitle: subtitle,),

          const SizedBox(height: 10),

          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),

              itemBuilder: (context, index){
                return _Slide(movie: movies[index]);
              })
              )
          ],),
    );
  }
}

class _Slide extends StatelessWidget {

  final Movie movie;

  const _Slide({required this.movie});

  @override
  Widget build(BuildContext context) {

    final textStyle = Theme.of(context).textTheme;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                fit: BoxFit.fill,
                movie.posterPath,
                width: 150,
                loadingBuilder: (context, child, loadingProgress){
                  if(loadingProgress !=null){
                    
                    return const Padding(
                      padding: EdgeInsets.all(2),
                      child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                    );
                  }

                  return FadeIn(child:child);
                },),

            ),
          ),

          const SizedBox(height: 10,),

          //Title
          SizedBox(
            width: 150,
            child: Text(
              movie.title, 
              style: textStyle.titleSmall, 
              maxLines: 2,),
          ),

          //Rating
          Row(children: [
            Icon(Icons.star_half_outlined, color: Colors.yellow.shade800,),
            Text('${movie.voteAverage}',style: textStyle.bodyMedium)
          ],)


          

        ],
      ),

    );
    
  
  }
}


class _Title extends StatelessWidget {
  final String? title;
  final String? subtitle;

  const _Title({
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    // final subtitleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if(title != null)
          Text(title!, style: titleStyle,),
          
          const Spacer(),
          
          if(subtitle != null)
          FilledButton.tonal(
            onPressed: () {}, 
            style: const ButtonStyle(visualDensity: VisualDensity.compact),
            child: Text(subtitle!), 
)
          // Text(subtitle!, style: subtitleStyle,),
         
        ],
      ),
    );
  }
}
