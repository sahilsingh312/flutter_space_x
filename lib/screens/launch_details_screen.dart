import 'package:flutter/material.dart';
import 'package:flutter_space_x/widgets/details_card.dart';
import 'package:provider/provider.dart';

import '../models/launch_details.dart';
import '../providers/upcoming_launches_provider.dart';

class DetailsScreen extends StatelessWidget {
  final String id;

  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Launch Details"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
      body: Consumer<LaunchesProvider>(
        builder: (context, launchesProvider, _) {
          return FutureBuilder<LaunchDetails>(
            future: launchesProvider.fetchLaunchDetails(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var details = snapshot.data;
                return DetailsCard(
                  id: id,
                  imageUrl: details!.missionPatch,
                  missionName: details.missionName,
                  rocketName: details.rocketName,
                  flightNumber: details.flightNumber,
                  redditUrl: details.reddit,
                  youtubeUrl: details.youtube,
                );
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }
              return const Center(child: CircularProgressIndicator());
            },
          );
        },
      ),
    );
  }
}
