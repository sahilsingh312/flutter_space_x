import 'package:flutter/material.dart';
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
      ),
      body: Consumer<LaunchesProvider>(
        builder: (context, launchesProvider, _) {
          return FutureBuilder<LaunchDetails>(
            future: launchesProvider.fetchLaunchDetails(id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(
                  children: <Widget>[
                    Text(snapshot.data!.missionName),
                    Text(snapshot.data!.flightNumber),
                    Text(snapshot.data!.rocketName),
                    Text(snapshot.data!.launchDateHumanReadable),
                  ],
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
