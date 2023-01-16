import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/favorites_provider.dart';
import '../screens/launch_details_screen.dart';

class LaunchTile extends StatelessWidget {
  final String id;
  final String missionName;
  final String rocketName;
  final String imageUrl;
  final String date;
  const LaunchTile(
      {super.key,
      required this.id,
      required this.missionName,
      required this.rocketName,
      required this.date,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: 16),
      child: Card(
        child: ListTile(
          visualDensity: const VisualDensity(vertical: 3),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsScreen(
                  id: id,
                ),
              ),
            );
          },
          leading: Image.network(imageUrl),
          title: Text(
            missionName,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 16),
          ),
          subtitle:
              Text(rocketName, style: Theme.of(context).textTheme.bodySmall),
          trailing: Column(
            children: [
              Consumer<FavoritesProvider>(
                builder: (context, favoritesProvider, _) {
                  favoritesProvider.init();
                  var isFavorite = favoritesProvider.favorites.contains(id);
                  return Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? Colors.red : null,
                  );
                },
              ),
              const SizedBox(
                height: 8,
              ),
              Text(date, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
          tileColor: const Color(0xffBCD4D8),
        ),
      ),
    );
  }
}
