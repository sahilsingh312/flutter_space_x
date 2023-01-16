import 'package:flutter/material.dart';
import 'package:flutter_space_x/widgets/launch_tile.dart';
import 'package:provider/provider.dart';

import '../providers/upcoming_launches_provider.dart';

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
          launches.sort((a, b) => b.launchDate.compareTo(a.launchDate));
          return RefreshIndicator(
            onRefresh: () async {
              await launchesProvider.fetchLaunches();
            },
            child: ListView.builder(
              itemCount: launches.length,
              itemBuilder: (context, index) {
                var launch = launches[index];
                return LaunchTile(
                    id: launch.id,
                    missionName: launch.missionName,
                    rocketName: launch.rocketName,
                    date: launch.launchDateHumanReadable,
                    imageUrl: launch.missionPatch);
              },
            ),
          );
        },
      ),
    );
  }
}
