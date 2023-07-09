import 'package:flutter/material.dart';
import 'package:movie_suggester/main.dart';
import 'package:provider/provider.dart';
import 'package:movie_suggester/Providers/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final homeState = Provider.of<HomeState>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Movie Suggestor'),
        ),
        body: homeState.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                ),
                itemCount: homeState.moviesModel?.moviesData?.length ?? 2,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigatorKey.currentState!
                          .pushNamed('/detailPage', arguments: {
                        'id': homeState.moviesModel!.moviesData![index].id,
                        'name': homeState.moviesModel!.moviesData![index].name,
                        'info': homeState.moviesModel!.moviesData![index].info,
                        'image':
                            homeState.moviesModel!.moviesData![index].image,
                        'rating':
                            homeState.moviesModel!.moviesData![index].rating,
                      });
                    },
                    child: Card(
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.network(
                              homeState.moviesModel!.moviesData![index].image!,
                            ),
                          ),
                          Text(
                            homeState.moviesModel!.moviesData![index].name!,
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(homeState.moviesModel!.moviesData![index].info!),
                        ],
                      ),
                    ),
                  );
                },
              ));
  }
}
