import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';
import '../providers/upcoming_launches_provider.dart';
import 'launch_details_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upcoming Launches"),
      ),
      body: Consumer<LaunchesProvider>(
        builder: (context, launchesProvider, _) {
          launchesProvider.fetchLaunches();
          var launches = launchesProvider.launches;
          if (launches.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: launches.length,
            itemBuilder: (context, index) {
              var launch = launches[index];
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(
                          id: launch.id,
                        ),
                      ),
                    );
                  },
                  leading: Image.network(launch.missionPatch),
                  title: Text(launch.missionName),
                  subtitle: Text(launch.rocketName),
                  trailing: Consumer<FavoritesProvider>(
                    builder: (context, favoritesProvider, _) {
                      favoritesProvider.init();
                      var isFavorite =
                          favoritesProvider.favorites.contains(launch.id);
                      return IconButton(
                        icon: Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          color: isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          favoritesProvider.toggleFavorite(launch.id);
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
